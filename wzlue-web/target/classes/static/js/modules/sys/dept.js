"use strict";

var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "deptId",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url: "nourl"
        }
    }
};
var ztree;

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        menu: { //菜单
            parentName: null,
            parentId: [],
            type: 1,
            deptType: '',
            newParentId: []
        },
        rules: {
            name: [{ required: true, message: '请输入菜单名称', trigger: 'blur' }],
            deptType: [{ required: true, message: '请选择机构类型', trigger: 'change' }],
            newParentId: [{ required: true, message: '请输入上级机构', trigger: 'change' }, {
                validator: function validator(rule, value, callback) {
                    if (value.length == 0) {
                        callback(new Error("请输入上级机构"));
                    } else {
                        callback();
                    }
                }, trigger: 'change'
            }],
            orderNum: [{ required: true, message: '请输入排序号', trigger: 'blur' }, {
                pattern: /^\+?[1-9]\d*$/,
                message: '只能输入正整数'
            }]
        },
        deptList: [], //组织架构List
        defaultProps: { //tree 参数---》规则
            children: 'list', //子集（tree插件---后台返回的数据名字）
            label: 'name' //显示的名称（tree插件---后台返回的数据名字）
        },
        props: { // Cascader 级联选择器  参数---》规则
            value: 'id',
            children: 'list',
            label: 'name'
        },
        i: 0, //多选 变为 单选 中间值
        newNode: {}, //节点详情
        options1: [{ code: "0", value: "部门" }, { code: "1", value: "公司" }],
        checkedDeptId: null, //选中的组织架构id,
        dialogVisible: false,
    },
    methods: {
        getData: function getData() {
            $.get(baseURL + "sys/sysdept/deptList/", function (r) {
                var a = r.treeList;
                vm.deptList = [{
                    id: 0,
                    list: a,
                    name: '顶级',
                    node: { name: '顶级', deptType: '1', parentName: null, createDate: null, updateDate: null }
                }];
            });
        },
        add: function add() {
            // vm.showList = false;
            vm.dialogVisible = true;
            vm.title = "新增";
            vm.checkedDeptId = null;
        },
        // update: function update() {
        //     if (vm.checkedDeptId == false) {
        //         return;
        //     }else if(vm.checkedDeptId == null){
        //         alert("请选择一条记录");
        //         return;
        //     }
        //
        //     $.get(T.config.baseURL + "sys/sysdept/info/" + vm.checkedDeptId, function (r) {
        //         vm.updateVisible = true;
        //         vm.title = "修改";
        //         vm.menu = r.menu;
        //         vm.getParentId(vm.menu.parentIds);
        //     });
        // },
        del: function del(menu) {
            if (vm.checkedDeptId == false) {
                return;
            }else if(vm.checkedDeptId == null){
                alert("请选择一条记录");
                return;
            }

            var newNode = vm.$refs.tree.getCurrentNode();
            if (newNode.list != null) {
                vm.$message.error("请先删除子集元素！");
                return;
            }
            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: baseURL + "sys/sysdept/delete",
                    data: "deptId=" + vm.checkedDeptId,
                    success: function success(r) {
                        if (r.code === 0) {
                            alert('操作成功', function () {
                                vm.reload(menu);
                            });
                            vm.getData();
                            vm.newNode={};
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        save: function saveOrUpdate(menu) {
            this.$refs[menu].validate(function (valid) {
                if (valid) {
                    var newParentId1 = vm.menu.newParentId[vm.menu.newParentId.length - 1];
                    vm.menu.parentId = newParentId1;
                    var url = "sys/sysdept/save";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.menu),
                        success: function success(r) {
                            if (r.code === 0) {
                                vm.dialogVisible = false;
                                // vm.menu = {parentName: null, parentId: [],type: 1,deptType: ''};
                                alert('操作成功', function () {
                                    vm.reload(menu);
                                });
                            } else {
                                alert(r.msg);
                            }
                        }
                    });
                } else {
                    return false;
                }
            });
        },
        update: function saveOrUpdate(newNode) {
            this.$refs[newNode].validate(function (valid) {
                if (valid) {
                    var newParentId1 = vm.newNode.newParentId[vm.newNode.newParentId.length - 1];
                    if(newParentId1 == vm.newNode.deptId){
                        alert("上级机构不能是当前选择部门");
                        return;
                    }
                    vm.newNode.parentId = newParentId1;
                    var url = "sys/sysdept/update";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.newNode),
                        success: function success(r) {
                            if (r.code === 0) {
                                vm.showList = true;
                                // vm.menu = {parentName: null, parentId: [],type: 1,deptType: ''};
                                alert('操作成功', function () {
                                    vm.reload(newNode);
                                });
                            } else {
                                alert(r.msg);
                            }
                        }
                    });
                } else {
                    return false;
                }
            });
        },
        //返回
        reload: function reload(event) {
            vm.$refs[event].resetFields();
            vm.dialogVisible = false;
            vm.$refs.tree.setCheckedKeys([]);
            if(event=='menu')
                vm.menu = {};
            else
                vm.newNode = {};
            vm.checkedDeptId = null;
            this.getData();
        },

        //使 多选 变为 单选
        handleClick: function handleClick(data, checked, node) {
            vm.i++;
            if (vm.i % 2 == 0) {
                if (checked) {
                    vm.$refs.tree.setCheckedNodes([]);
                    vm.$refs.tree.setCheckedNodes([data]);
                    //交叉点击节点
                } else {
                    vm.$refs.tree.setCheckedNodes([]);
                    //点击已经选中的节点，置空
                }
            }
        },

        //获取树 的deptId
        getCheckedKeys: function getCheckedKeys(selected) {
            // var id = vm.$refs.tree.getCurrentKey();
            if (selected.length == 0) {
                alert("请选择一条记录");
                return false;
            } else if (selected[0] == 0) {
                alert("顶级栏无法操作");
                return false;
            } else {
                return selected[0];
            }
        },

        //tree节点被点击时的回调
        reloadTree: function reloadTree() {
            var id = vm.$refs.tree.getCurrentKey();
            vm.newNode = vm.$refs.tree.getCurrentNode().node;
            //选中后 设置选中的key集合
            vm.$refs.tree.setCheckedKeys([id]);
            vm.checkedDeptId = vm.getCheckedKeys(vm.$refs.tree.getCheckedKeys());
            vm.getParentId(vm.newNode,vm.newNode.parentIds);
        },
        //转为 Cascader 级联选择器 组件 需要的数组（最后一个空,把String[]转为Integer[]）
        getParentId: function getParentId(event,val) {
            var parents = val.split(",");
            var newParents = [];
            parents.splice(parents.length - 1, 1);
            parents.forEach(function (item, index) {
                newParents.push(+item);
            });
            // vm.menu.parentId = newParents;
            event.newParentId = newParents;
        }
    },
    created: function created() {
        this.getData();
    }
});
