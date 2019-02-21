$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sys/user/list',
        datatype: "json",
        colModel: [			
			{ label: '用户ID', name: 'userId', index: "user_id", width: 45, key: true },
			{ label: '用户名', name: 'username', width: 75 },
			{ label: '邮箱', name: 'email', width: 90 },
			{ label: '手机号', name: 'mobile', width: 100 },
			{ label: '状态', name: 'status', width: 80, formatter: function(value, options, row){
				return value === 0 ? 
					'<span class="label label-danger">禁用</span>' : 
					'<span class="label label-success">正常</span>';
			}},
			{ label: '创建时间', name: 'createTime', index: "create_time", width: 80}
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
    $("#form").FM({'fields': vm.fields, "success": vm.saveOrUpdate});
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			username: null
		},
		showList: true,
		title:null,
		roleList:{},
        deptList:[],
		treeList:[],
		user:{
			status:1,
			roleIdList:[]
		},
        fields: {
            username: {
                message: '用户验证失败',
                validators: {
                    notEmpty: {
                        message: '用户不能为空'
                    },
                    //长度校验
                    stringLength: {
                        min: 1,
                        max: 20,
                        message: '用户名长度必须在2到20之间'
                    },
                    threshold:2,
                    remote:{
                        url:baseURL + 'sys/user/checkname',
                        message: '用户已存在',//提示消息,
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'POST'//请求方式
					},
                },
            },
            password: {
                message: '密码验证失败',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    //长度校验
                    stringLength: {
                        min: 6,
                        max: 50,
                        message: '密码长度必须在6到50之间'
                    },
                },
            },
            email: {
                message: '邮箱验证失败',
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '请输入正确的邮箱地址'
                    }
                },
            },
            mobile: {
                message: '手机号验证失败',
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    //正则校验
                    regexp: {
                        regexp: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
                        message: '手机号码不正确'
                    }
                },
            },

        },
	},
	methods: {
        validFromSuccess: function () {
            var bl = $('#form').VF();//启用验证
            if (!bl) {
                return;
            }
        },
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.roleList = {};
			vm.user = {status:1,roleIdList:[]};
			
			//获取角色信息
			this.getRoleList();

			//获取部门树结构
			this.departmentTree();
        },
		update: function () {
			var userId = getSelectedRow();
			if(userId == null){
				return ;
			}
			
			vm.showList = false;
            vm.title = "修改";
			
			vm.getUser(userId);
			//获取角色信息
			this.getRoleList();

            //获取部门树结构
            this.departmentTree();
		},
		del: function () {
			var userIds = getSelectedRows();
			if(userIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "sys/user/delete",
                    contentType: "application/json",
				    data: JSON.stringify(userIds),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(){
                                vm.reload();
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		saveOrUpdate: function () {
            // if(vm.validator()){
            //     return ;
            // }

			var url = vm.user.userId == null ? "sys/user/save" : "sys/user/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.user),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		getUser: function(userId){
			$.get(baseURL + "sys/user/info/"+userId, function(r){
				vm.user = r.user;
				vm.user.password = null;
			});
		},
		getRoleList: function(){
			$.get(baseURL + "sys/role/select", function(r){
				vm.roleList = r.list;
			});
		},
		reload: function () {
			vm.showList = true;
			vm.title = "";
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'username': vm.q.username},
                page:page
            }).trigger("reloadGrid");
		},
        validator: function () {
            if(isBlank(vm.user.username)){
                alert("用户名不能为空");
                return true;
            }

            if(vm.user.userId == null && isBlank(vm.user.password)){
                alert("密码不能为空");
                return true;
            }

            if(isBlank(vm.user.email)){
                alert("邮箱不能为空");
                return true;
            }

            if(!validator.isEmail(vm.user.email)){
                alert("邮箱格式不正确");
                return true;
			}
        },

        departmentTree:function (){
            $.get(baseURL + "sys/sysdept/deptList/", function (r) {
                var a = r.treeList;
                vm.deptList = [{
                    id: 0,
                    list: a,
                    name: '顶级',
                    node: { name: '顶级', deptType: '1', parentName: null, createDate: null, updateDate: null }
                }];
                console.log("dept",vm.deptList);
                vm.treeList = eval(JSON.stringify(r.treeList) );
                console.log("data",vm.treeList);
            });
		},

        buildDomTree:function () {
			var data = [];
			var root = "所属部门";
			function walk(nodes, data) {
				if (!nodes) {
					return;
				}
				$.each(nodes, function(id, node) {
					var obj = {
						id : id,
						text : node.name != null ? node.name : root,
							// tags : [ node.isLeaf == true ? node.
							// 		+ ' child elements'
							// 		: '' ]
						deptId:node.id,
					};
					console.log("node",node);
					if (node.isLeaf = true) {
						obj.nodes = [];
						walk(node.list, obj.nodes);
					}
					data.push(obj);
				});
			};

			walk(vm.treeList, data);
			console.log("***",data);
			return data;
		},


        //$("#txt_departmentname").click(
    		departmentname:function() {
			var options = {
				bootstrap2 : false,
				showTags : true,
				levels : 5,
				//showCheckbox : true,
				checkedIcon : "glyphicon glyphicon-check",
				data : vm.buildDomTree(),
				onNodeSelected : function(event, data) {
					$("#txt_departmentname").val(data.text);
                    vm.user.departmentId=data.deptId;
					$("#treeview").hide();
                    console.log("val0",event);
					console.log("val",data.deptId);
				},
			};

			$('#treeview').treeview(options);
		},

	}
});