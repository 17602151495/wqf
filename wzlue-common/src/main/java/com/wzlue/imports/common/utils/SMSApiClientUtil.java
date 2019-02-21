package com.wzlue.imports.common.utils;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import sun.misc.BASE64Encoder;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 *  短信代理平台HTTP接口Java开发示例
 *  具体接口说明请查看文档《短信代理平台HTTP接口文档.docx》
 *  	短信发送接口与其他业务接口区别：
 *  		1.请求地址端口不同，详细查看示例说明;
 *          2.短信发送采用POST方式并设置请求头信息，而其他业务接口采用GET方式;
  * @ClassName: ApiDemo4JavaHttpClient
  * @Description: 
  * @author Peng_Hu
  * @date 2017年2月14日 上午11:44:20
  *
  */
public class SMSApiClientUtil {

	/**
	 *	账号
	 */
	private static String ACCOUNT_SID = "WZLUE02";
	/**
	 * APIKEY
	 */
	private static String ACCOUNT_APIKEY = "05522DF0F3F7494B8919D1561C229E9C";
	/**
	 * utf8编码
	 */
	private static final String CHARSET_UTF8 = "utf-8";
	private static final String CHARSET_GBK = "gbk";
	
	/**
	 * 短信发送接口请求地址
	 */
	private static String SendSmsHttpPostUrl = "http://101.37.77.10:7090/api/rest";
	/**
	 * 其他HTTP接口地址
	 */
	private static String OtherApiHttpGetUrl = "http://101.37.77.10:7099/api/rest";

	public static final  String TEMPLETE_VALIDATE_CODE = "2b84c934ec98474f8ae0ec158e7e6885";

	public static final  int  EXPIRED_MINUTE = 3;
	
	/**
	 * @param args
	 * void 
	*/
	public static void main(String[] args) {
		/******获取短信账号信息**************/
//		queryUser();
		
		/******获取某个模板信息**************/
//		queryTemplateById("模板编号");
		
		/******获取账号所有模板信息***********/
//		queryTemplateByAccount();
		
		/******创建模板***********/
//		createTemplate("注册成功提示", "欢迎使用江苏美圣短信运营管理平台。", "2","备注");
		
//		createTemplate("登录验证码", "您的本次手机验证码是@1@，请于5分钟内完成操作。", "1","备注");
		/******修改模板***********/
//		updateTemplate("模板编号","登录验证码", "您的本次手机验证码是@1@，请于@2@分钟内完成操作,短信运营管理平台。", "1","2","备注");
		
		
		//发送模板短信
		Random r = new Random();
		/******发送普通短信**************/
		//sendSms("您的验证码："+r.nextInt(10000), "手机号码","000");

		//System.out.println(r.nextInt(10000));
		
		/******发送普通加密短信**************/
		//String result = sendEncryptSms("您的验证码："+r.nextInt(10000), "手机号码","0010");

		/******发送模板短信**************/
		String result = sendTplSms("2b84c934ec98474f8ae0ec158e7e6885", "@1@="+r.nextInt(10000)+"||@2@=5", "13451916288","");
		System.out.println(result);
//		sendTplSms("模板编号", "", "手机号码","");
		
		
		/******发送模板加密短信**************/
//		sendEncryptTplSms("模板编号", "@1@="+r.nextInt(10000)+"||@2@=25", "手机号码","");
		
//		sendEncryptTplSms("模板编号", "", "手机号码","");
		/*****获取状态报告********/
//		queryRpt();
		
		/*****获取上行短信********/
//		queryMO();
	}
     
    
    /**
     * 发送普通短信
     * @param content 短信内容
     * @param mobiles 手机号码  （多个以英文逗号隔开，最多10000个号码）
     * @param extno 自定义扩展码（建议1-3位,需此功能请联系客服申请开通，取值范围:0-999）
     * @return
     * String
     */
    public static String sendSms(String content,String mobiles,String extno){
    	String sign = "";
    	try {
    		/**
			 * 签名认证 sign=md5(sid+apikey+tplid+mobile+content);
			 * 若sid和apikey确定无误，请求返回值返回1005错误码（sign参数签名认证错误），
			 * 处理方法：短信内容包含中文字符，请采用utf-8或gb2312转码后进行md5签名后提交发送 
			 */
    		StringBuilder signStr = new StringBuilder();
    		signStr.append(ACCOUNT_SID).append(ACCOUNT_APIKEY).append(mobiles).append(content);
    		sign = md5Digest(signStr.toString());
    	} catch (NoSuchAlgorithmException e) {
    		e.printStackTrace();
    	} catch (UnsupportedEncodingException e) {
    		e.printStackTrace();
    	}
    	StringBuilder url = new StringBuilder();
    	url.append(SendSmsHttpPostUrl).append("/sms/sendSms");
    	
    	//添加POST请求参数
    	Map<String,String> params = new HashMap<String,String>();
    	params.put("sid", ACCOUNT_SID);
    	params.put("sign", sign);
    	params.put("mobile", mobiles);	
    	params.put("content", content);
    	//params.put("time", "20170222120222");  //定时短信：格式:yyyyMMddmmhhss
    	params.put("extno", extno);
    	
    	//发送Http Post请求
    	String resultJson = sendHttpPost(url.toString(), params);
    	System.out.println("/sms/sendTplSms="+resultJson);
    	return resultJson;
    }
    
    
    /**
     * 发送模板短信
     * @param tplId 模板编号
     * @param content 参数值，多个参数以“||”隔开   如:@1@=HY001||@2@=3281
     * @param mobiles 手机号码，多个以英文逗号隔开，最多10000个号码
     * @param extno 自定义扩展码，建议1-4位,需此功能请联系客服申请开通，取值范围:0-9999
     * @return
     * String
     */
	public static String sendTplSms(String tplId,String content,String mobiles,String extno){
		//签名
		String sign = "";
		try {
			/**
			 * 签名认证 sign=md5(sid+apikey+tplid+mobile+content);
			 * 若sid和apikey确定无误，请求返回值返回1005错误码（sign参数签名认证错误），
			 * 处理方法：短信内容包含中文字符，请采用utf-8或gb2312转码后进行md5签名后提交发送 
			 */
			StringBuilder signStr = new StringBuilder();
			signStr.append(ACCOUNT_SID).append(ACCOUNT_APIKEY).append(tplId).append(mobiles).append(content);
			
			sign = md5Digest(signStr.toString());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		StringBuilder url = new StringBuilder();
		url.append(SendSmsHttpPostUrl).append("/sms/sendTplSms");
		//添加POST请求参数
		Map<String,String> params = new HashMap<String,String>();
		params.put("sid", ACCOUNT_SID);
		params.put("sign", sign);
		params.put("tplid", tplId);
		params.put("mobile", mobiles);
		params.put("content", content);
		params.put("extno", extno);
		
		//发送Http Post请求
		String resultJson = sendHttpPost(url.toString(), params);
		//System.out.println("/sms/sendTplSms="+resultJson);
		return resultJson;
	}
	
	/**
	 * 发送普通加密短信
	 * @param content 短信内容
     * @param mobiles 手机号码  （多个以英文逗号隔开，最多10000个号码）
     * @param extno 自定义扩展码（建议1-3位,需此功能请联系客服申请开通，取值范围:0-999）
	 * @return
	 * String
	 */
	public static String sendEncryptSms(String content,String mobiles,String extno){
		//明文，格式：mobiles##content
		String plainText = mobiles + "##" + content;
		//密文，AES加密后再进行BASE64加密
		String cipherText = encrypt2Base64(plainText, ACCOUNT_APIKEY);
		
		//签名认证 sign=md5(sid+apikey+cipherText);
		String sign = "";
		try {
			StringBuilder signStr = new StringBuilder();
			signStr.append(ACCOUNT_SID).append(ACCOUNT_APIKEY).append(cipherText);
			sign = md5Digest(signStr.toString());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		StringBuilder url = new StringBuilder();
		url.append(SendSmsHttpPostUrl).append("/encryptsms/sendSms");
		Map<String,String> params = new HashMap<String,String>();
		params.put("sid", ACCOUNT_SID);
		params.put("sign", sign);
		params.put("text", cipherText);
		params.put("extno", extno);
		String resultJson = sendHttpPost(url.toString(), params);
		System.out.println("/encryptsms/sendSms="+resultJson);
		return resultJson;
	}
	
	/**
	 * 发送模板加密短信
	 * @param tplId 模板编号
	 * @param content 参数值，多个参数以“||”隔开   如:@1@=HY001||@2@=3281
     * @param mobiles 手机号码，多个以英文逗号隔开，最多10000个号码
     * @param extno 自定义扩展码，建议1-3位,需此功能请联系客服申请开通，取值范围:0-999
	 * @return
	 * String
	 */
	public static String sendEncryptTplSms(String tplId,String content,String mobiles,String extno){
		//明文 ，格式：mobiles##content
		String plainText = mobiles + "##" + content;
		//密文， AES加密后再进行BASE64加密
		String cipherText = encrypt2Base64(plainText, ACCOUNT_APIKEY);
		
		//签名认证 sign=md5(sid+apikey+tplid+cipherText);
		String sign = "";
		try {
			StringBuilder signStr = new StringBuilder();
			signStr.append(ACCOUNT_SID).append(ACCOUNT_APIKEY).append(tplId).append(cipherText);
			sign = md5Digest(signStr.toString());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		StringBuilder url = new StringBuilder();
		url.append(SendSmsHttpPostUrl).append("/encryptsms/sendTplSms");
		Map<String,String> params = new HashMap<String,String>();
		params.put("sid", ACCOUNT_SID);
		params.put("sign", sign);
		params.put("tplid", tplId);
		params.put("text", cipherText);
		params.put("extno", extno);
		
		String resultJson = sendHttpPost(url.toString(), params);
		System.out.println("/encryptsms/sendTplSms="+resultJson);
		return resultJson;
	}
	


	/**
	 * 查询账号信息
	 * 	/user/get?sid={sid}&sign={sign}
	 * @return json字符串,详细描述请参考接口文档 
	 * String
	 */
	public static String queryUser(){
		String sign = "";
		try {
			//签名认证 sign=md5(sid+apikey);
			sign = md5Digest(ACCOUNT_SID + ACCOUNT_APIKEY);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//请求url
		StringBuilder url = new StringBuilder();
		url.append(OtherApiHttpGetUrl).append("/user/get").append("?sid=").append(ACCOUNT_SID).append("&sign=").append(sign);
		
		//发送Http Get请求
		String resultJson = sendHttpGet(url.toString());
		System.out.println("/user/get=" + resultJson);
		return resultJson;
	}
	
	
	/**
	 * 查询某个模板信息
	 * /tpl/gets?sid={sid}&sign={sign}
	 * @return json字符串,详细描述请参考接口文档 
	 * @return
	 * String
	 */
	public static String queryTemplateByAccount(){
		String sign = "";
		try {
			//签名认证 sign=md5(sid+apikey);
			sign = md5Digest(ACCOUNT_SID + ACCOUNT_APIKEY);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//请求url
		StringBuilder url = new StringBuilder();
		url.append(OtherApiHttpGetUrl).append("/tpl/gets").append("?sid=").append(ACCOUNT_SID).append("&sign=").append(sign);
		
		//发送Http Get请求
		String resultJson = sendHttpGet(url.toString());
		System.out.println("/tpl/gets=" + resultJson);
		return resultJson;
	}
	
	/**
	 * 查询某个模板信息
	 * /tpl/get?sid={sid}&sign={sign}&tplid={tplid}
	 * @return json字符串,详细描述请参考接口文档 
	 * @return
	 * String
	 */
	public static String queryTemplateById(String tplId){
		//签名
		String sign = "";
		try {
			//签名认证 sign=md5(sid+apikey);
			sign = md5Digest(ACCOUNT_SID + ACCOUNT_APIKEY + tplId);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//请求url
		StringBuilder url = new StringBuilder();
		url.append(OtherApiHttpGetUrl).append("/tpl/get").append("?sid=").append(ACCOUNT_SID).append("&sign=").append(sign).append("&tplid=").append(tplId);
		
		//发送Http Get请求
		String resultJson = sendHttpGet(url.toString());
		System.out.println("/tpl/get=" + resultJson);
		return resultJson;
	}
	
	/**
	 * 更新模板信息
	 * @param tplid 模板编号
	 * @param name 模板名称
	 * @param content 模板内容 如：您的验证码@1@,欢迎使用@2@平台
	 * @param type 类型 1-验证码 2-通知类   3-会员类 4-其他
	 * @param state 模板状态 1-启用 0-禁用
	 * @param remark 模板备注
	 * @return
	 * String
	 */
	public static String updateTemplate(String tplid,String name,String content,String type,String state,String remark){
		//签名
		String sign = "";
		try {
			sign = md5Digest(ACCOUNT_SID + ACCOUNT_APIKEY + tplid);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		StringBuilder url = new StringBuilder();
		url.append(OtherApiHttpGetUrl).append("/tpl/update");
		Map<String,String> params = new HashMap<String,String>();
		params.put("sid", ACCOUNT_SID);
		params.put("sign", sign);
		params.put("tplid", tplid);
		params.put("name", name);
		params.put("content", content);
		params.put("type", type);
		params.put("state", state);
		params.put("remark", remark);
		String resultJson = sendHttpPost(url.toString(), params);
		System.out.println("/tpl/update="+resultJson);
		return resultJson;
	}
	
	/**
	 * 创建模板信息
	 * @param name 模板名称
	 * @param content 模板内容 如：您的验证码@1@,欢迎使用@2@平台
	 * @param type 类型 1-验证码 2-通知类   3-会员类 4-其他
	 * @param remark 模板备注
	 * @return
	 * String
	 */
	public static String createTemplate(String name,String content,String type,String remark){
		//签名
		String sign = "";
		try {
			sign = md5Digest(ACCOUNT_SID + ACCOUNT_APIKEY);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		StringBuilder url = new StringBuilder();
		url.append(OtherApiHttpGetUrl).append("/tpl/create");
		Map<String,String> params = new HashMap<String,String>();
		params.put("sid", ACCOUNT_SID);
		params.put("sign", sign);
		params.put("name", name);
		params.put("content", content);
		params.put("type", type);
		params.put("remark", remark);
		
		String resultJson = sendHttpPost(url.toString(), params);
		System.out.println("/tpl/createTemplate="+resultJson);
		return resultJson;
	}
	
	
	/**
	 * 获取状态报告
	 * 	每次请求只能获取未被获取过的短信状态报告，已获取的报告不会重复获取;单次请求最多获取10000条状态报告记录。
	 * @return json字符串,详细描述请参考接口文档 
	 * String
	 */
	public static String queryRpt(){
		String sign = "";
		try {
			//签名认证 sign=md5(sid+apikey);
			sign = md5Digest(ACCOUNT_SID + ACCOUNT_APIKEY);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//请求url
		StringBuilder url = new StringBuilder();
		url.append(OtherApiHttpGetUrl).append("/report/query").append("?sid=").append(ACCOUNT_SID).append("&sign=").append(sign);
		
		//发送Http Get请求
		String resultJson = sendHttpGet(url.toString());
		System.out.println("resultJson=" + resultJson);
		return resultJson;
	}
	
	
	/**
	 * 获取上行状态报告
	 * 	每次请求只能获取未被获取过的上行短信，已获取的上行短信不会重复获取;单次请求最多获取10000条上行短信记录
	 * @return json字符串,详细描述请参考接口文档 
	 * String
	 */
	public static String queryMO(){
		String sign = "";
		try {
			//签名认证 sign=md5(sid+apikey);
			sign = md5Digest(ACCOUNT_SID + ACCOUNT_APIKEY);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//请求url
		StringBuilder url = new StringBuilder();
		url.append(OtherApiHttpGetUrl).append("/deliver/query").append("?sid=").append(ACCOUNT_SID).append("&sign=").append(sign);
		
		//发送Http Get请求
		String resultJson = sendHttpGet(url.toString());
		System.out.println("resultJson=" + resultJson);
		return resultJson;
	}
	
	/**
	 * 
	 * @param apiUrl 接口请求地址
	 * @param paramsMap 请求参数集合
	 * @return json字符串,详细描述请参考接口文档
	 * String
	 */
    private static String sendHttpPost(String apiUrl, Map<String, String> paramsMap) {
        CloseableHttpClient client = HttpClients.createDefault();
        String responseText = "";
        CloseableHttpResponse response = null;
        try {
            HttpPost httpPost = new HttpPost(apiUrl);
            //设置请求和传输超时时间
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(20000).setConnectTimeout(20000).build();
            if (paramsMap != null) {
                List<NameValuePair> paramList = new ArrayList<NameValuePair>();
                for (Map.Entry<String, String> param : paramsMap.entrySet()) {
                    NameValuePair pair = new BasicNameValuePair(param.getKey(), param.getValue());
                    paramList.add(pair);
                }
                httpPost.setEntity(new UrlEncodedFormEntity(paramList, CHARSET_UTF8));
            }
            httpPost.setConfig(requestConfig);
            response = client.execute(httpPost);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                responseText = EntityUtils.toString(entity,CHARSET_UTF8);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                response.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return responseText;
    }
    
	/**
	 * 发送Http Get请求
	 * @param url 请求地址
	 * @return json字符串,详细描述请参考接口文档
	 * String
	 */
	private static String sendHttpGet(String url){
		System.out.println("url=" + url);
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String resultJson = "";
		CloseableHttpResponse response = null;
		try {
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(20000).setConnectTimeout(20000).build();
			HttpGet httpGet =  new HttpGet(url);
			httpGet.setConfig(requestConfig);
			response = httpclient.execute(httpGet);
			HttpEntity entity = response.getEntity();
			if (entity != null){
				resultJson = EntityUtils.toString(entity, CHARSET_UTF8);
			}
			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			try {
                response.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
		}
		return resultJson;
	}
	
	
	/**
	 * 加密 
	 * @param mac 消息明文，格式：MobilesAndContent 如：1380000901,13800000002##短信内容
	 * @param apikey 账号apikey
	 * @return 加密后进行base64加密
	 * String
	 */
	private static String encrypt2Base64(String mac,String apikey){
		byte[] encryptbytes = encrypt(mac, apikey);
		//RFC822规定，BASE64Encoder编码每76个字符需要加上一个回车换行符，也可以采用commons-codec-**.jar进行解密，Base64.encodeBase64("");
		String result = new BASE64Encoder().encode(encryptbytes);
		return result;
	}
	/**
	 * 加密 
	 * @param mac 消息明文，格式：MobilesAndContent 如：1380000901,13800000002##短信内容
	 * @param apikey 账号apikey
	 * @return 加密后字节数组
	 * String
	 */
	private static byte[] encrypt(String mac, String apikey){
		//校验apikey
		if(apikey.length() != 32){
			return null;
		}
		try {       
			//
			Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
			int blockSize = cipher.getBlockSize();  
			byte[] dataBytes = mac.getBytes(CHARSET_UTF8);  
			//计算数据块,16倍数，否则用0补齐
			int plaintextLength = dataBytes.length;  
			if (plaintextLength % blockSize != 0) {  
				plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));  
			}  
			byte[] plaintext = new byte[plaintextLength];
			
			System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);
			
			SecretKeySpec keyspec = new SecretKeySpec(apikey.substring(0, 16).getBytes(), "AES");  
			
			IvParameterSpec ivspec = new IvParameterSpec(apikey.substring(16, 32).getBytes());
			
			cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
			
			byte[] result = cipher.doFinal(plaintext);  
			
			return result; 
		} catch (NoSuchAlgorithmException e) {  
			e.printStackTrace();  
		} catch (NoSuchPaddingException e) {  
			e.printStackTrace();  
		} catch (InvalidKeyException e) {  
			e.printStackTrace();  
		} catch (UnsupportedEncodingException e) {  
			e.printStackTrace();  
		} catch (IllegalBlockSizeException e) {  
			e.printStackTrace();  
		} catch (BadPaddingException e) {  
			e.printStackTrace();  
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		}   
		return null;  
	}
	
	private static String md5Digest(String src) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] b = md.digest(src.getBytes(CHARSET_UTF8));
		return byte2HexStr(b);
	}
	private static String byte2HexStr(byte[] b){
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < b.length; ++i) {
			String s = Integer.toHexString(b[i] & 0xFF);
			if (s.length() == 1)
				sb.append("0");
			sb.append(s.toUpperCase());
		}
		return sb.toString();
	}
}
