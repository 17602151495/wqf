$(function () {
    $("#table").BT({
        url: baseURL + 'sys/dict/list',
        columns: [
            {checkbox: true},
            {title: '字典名称', field: 'name'},
            {title: '字典类型', field: 'type'},
            {title: '字典码', field: 'code'},
            {title: '字典值', field: 'value'},
            {title: '报关', field: 'customs'},
            {title: '报检', field: 'inspection'},
            {title: '排序', field: 'orderNum'},
            {title: '备注', field: 'remark'}
        ],
        //条件查询
        queryParams: vm.params,
        search: true,
        onLoadSuccess: function (data) {

        }
    });

    $("#dictForm").FM({'fields': vm.fields, "success": vm.saveOrUpdate});

    $.get(baseURL + "sys/dict/typeList", function (r) {
        vm.typeList.push({'value': null, 'label': '全部'});

        r.typeList.forEach(function (val, idx, arr) {
            vm.typeList.push({'value': val.code, 'label': val.name});
        })
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        params: {
            name: '',
            type: null
        },
        dict: {},
        typeList: [],
        fields: {
            dictname: {validators: {notEmpty: {message: '字典名称不能为空'}}},
            dicttype: {validators: {notEmpty: {message: '字典类型不能为空'}}},
            dictcode: {validators: {notEmpty: {message: '字典码不能为空'}}},
            dictvalue: {validators: {notEmpty: {message: '字典值不能为空'}}},
            dictorderNum: {validators: {notEmpty: {message: '排序不能为空'}}},
            dictdelFlag: {validators: {notEmpty: {message: '删除标记不能为空'}}},
            customs: {validators: {notEmpty: {message: '报关不能为空'}}},
            inspection: {validators: {notEmpty: {message: '保检不能为空'}}},
        }
    },
    methods: {
        validFromSuccess: function () {
            var bl = $('#dictForm').VF();//启用验证
            if (!bl) {
                return;
            }
        },
        query: function (data) {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.dict = {};
        },
        update: function (event) {
            var id = getSelectedRowId("id");
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";
            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.dict.id == null ? "sys/dict/save" : "sys/dict/update";
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.dict),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        del: function (event) {
            var ids = getSelectedRowsId("id");
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: baseURL + "sys/dict/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                vm.reload();
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        getInfo: function (id) {
            $.get(baseURL + "sys/dict/info/" + id, function (r) {
                vm.dict = r.dict;
            });
        },
        reload: function (event) {
            vm.showList = true;
            //刷新 如需条件查询common.js
            $("#table").BTF5();
        }
    }
});