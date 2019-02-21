package com.wzlue.imports.common.utils;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.*;

public class XmlUtils {

    private static Logger log = Logger.getLogger(XmlUtils.class);
    /**
     *
     * @param document
     *            Document对象（读xml生成的）
     * @return String字符串
     * @throws Throwable
     */
    public static String xmlToString(Document document) throws Throwable {
        TransformerFactory ft = TransformerFactory.newInstance();
        Transformer ff = ft.newTransformer();
        ff.setOutputProperty("encoding", "GB2312");
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ff.transform(new DOMSource(document), new StreamResult(bos));
        return bos.toString();
    }

    /**
     *
     * @param str xml字符串
     * @return Document 对象
     */
    public static Document StringTOXml(String str) {
        StringBuilder sXML = new StringBuilder();
        sXML.append(str);
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        Document doc = null;
        try {
            InputStream is = new ByteArrayInputStream(sXML.toString().getBytes("utf-8"));
            doc = dbf.newDocumentBuilder().parse(is);
            is.close();
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        return doc;
    }
    /*
 * 把dom文件转换为xml字符串
 */
    public static String toStringFromDoc(Document document) {
        String result = null;
        if (document != null) {
            StringWriter strWtr = new StringWriter();
            StreamResult strResult = new StreamResult(strWtr);
            TransformerFactory tfac = TransformerFactory.newInstance();
            try {
                javax.xml.transform.Transformer t = tfac.newTransformer();
                t.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
                t.setOutputProperty(OutputKeys.INDENT, "yes");
                t.setOutputProperty(OutputKeys.METHOD, "xml"); // xml, html,
                // text
                t.setOutputProperty(
                        "{http://xml.apache.org/xslt}indent-amount", "4");
                t.transform(new DOMSource(document.getDocumentElement()),
                        strResult);
            } catch (Exception e) {
                System.err.println("XML.toString(Document): " + e);
            }
            result = strResult.getWriter().toString();
            try {
                strWtr.close();
            } catch (IOException e) {
                log.error(e.getMessage());
            }
        }


        return result;
    }


    /**
     *
     * @param document
     * @return 某个节点的值 前提是需要知道xml格式，知道需要取的节点相对根节点所在位置
     */
    public static String getNodeValue(Document document, String nodePaht) {
        XPathFactory xpfactory = XPathFactory.newInstance();
        XPath path = xpfactory.newXPath();
        String servInitrBrch = "";
        try {
            servInitrBrch = path.evaluate(nodePaht, document);
        } catch (XPathExpressionException e) {
            log.error(e.getMessage());
        }
        return servInitrBrch;
    }

    /**
     *
     * @param document
     * @param nodePath
     *            需要修改的节点相对根节点所在位置
     * @param vodeValue
     *            替换的值
     */
    public static void setNodeValue(Document document, String nodePath, String vodeValue) {
        XPathFactory xpfactory = XPathFactory.newInstance();
        XPath path = xpfactory.newXPath();
        Node node = null;
        ;
        try {
            node = (Node) path.evaluate(nodePath, document, XPathConstants.NODE);
        } catch (XPathExpressionException e) {
            log.error(e.getMessage());
        }
        node.setTextContent(vodeValue);
    }
    /**
     * 带命名空间的xml 转 javabean
     * cal  对象Class类型
     * xmlStr xml报文字符串
     */

    public static Object xmlToObject(Class<?> cla, String xmlStr){
        JAXBContext jaxbContext = null;
        try {
            jaxbContext = JAXBContext.newInstance(cla);
        } catch (JAXBException e) {
            log.error(e.getMessage());
        }
        Unmarshaller unmarshaller = null;
        try {
            unmarshaller = jaxbContext.createUnmarshaller();
        } catch (JAXBException e) {
            log.error(e.getMessage());
        }
        StringReader reader = new StringReader(xmlStr);
        SAXParserFactory sax = SAXParserFactory.newInstance();
        sax.setNamespaceAware(false);//设置忽略命名空间
        XMLReader xmlReader = null;
        try {
            xmlReader = sax.newSAXParser().getXMLReader();
        } catch (SAXException e) {
            log.error(e.getMessage());
        } catch (ParserConfigurationException e) {
            log.error(e.getMessage());
        }
        //Source source = new SAXSource(xmlReader, new InputSource(reader));
        Source source = new SAXSource(xmlReader, new InputSource(reader));

        Object obj = null;
        try {
            obj = unmarshaller.unmarshal(source);
        } catch (JAXBException e) {
            log.error(e.getMessage());
        }
        return obj;

    }
}
