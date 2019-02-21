var commodity = {
    template:
        `<div>
            <form class="form-inline">
                <div class='form-group col-sm-3'>
                     <label>企业商品货号:</label>
                     <input type="text" class="input-medium search-query form-control" v-model.trim="params.commoditySku" placeholder="企业商品货号" maxlength="40"/>
                </div>
                <div class='form-group  col-sm-3'>
                     <label>企业商品名称:</label>
                     <input type="text" class="input-medium search-query form-control" v-model.trim="params.commodityName" placeholder="企业商品名称" maxlength="40"/>
                </div>
                <div class='form-group col-sm-3'>
                     <label>条形码:</label>
                     <input type="text" class="input-medium search-query  form-control" v-model.trim="params.commodityBarCode" placeholder="条形码" maxlength="50"/>
                </div>
                <div class='form-group col-sm-3'>
                    <label class="sr-only"></label>
                    <button class="btn btn-sm btn-default" type="button" @click="query">搜索</button>
                </div>
            </form>
            <h3>&nbsp;</h3> 
            <table id="comodityList" style="table-layout:fixed" class="table table-condensed table-bordered table-hover"></table>
        </div>`,
    data: function data() {
        return {
            params: {
                commoditySku: '',
                commodityName: '',
                commodityBarCode: '',
                commodityStatus: '0'
            },
            productList: [],
            productType: [],
        };
    },
    props: ['title'],
    methods: {
        getData: function getTreeData() {
            var current = this;
            window.addComodity = function (data) {
                current.$emit("add-comodity", data);
            };
            $("#comodityList").BT({
                url: window.baseURL + 'commodity/commodity/list',
                columns: [
                    {title: '商品序号', field: 'commodityNo', formatter: count},
                    {title: '企业商品货号', field: 'commoditySku'},
                    {title: '企业商品名称', field: 'commodityName'},
                    {title: '企业商品描述', field: 'commodityDescription'},
                    {title: '条形码', field: 'commodityBarCode'},
                    {title: '单位', field: 'commodityUnitName'},
                    {title: '单价', field: 'commodityPrice'},
                    {title: '生产国', field: 'commodityProducingCountriesName'},
                    {title: '备注', field: 'commodityNode'},
                    /* {
                         title: '状态',
                         field: 'commodityStatus',
                         align: 'center',
                         valign: 'middle',
                         formatter: current.operateFormatter,
                         width: '5%'
                     },*/
                    {
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        formatter: current.addFormatter,
                        width: '5%'
                    },
                ],
                //条件查询
                queryParams: this.params,
                onLoadSuccess: function () {
                    $("#comodityList td").attr('style', 'overflow:hidden;white-space:nowrap;text-overflow:ellipsis;text-align:center;');
                    current.addMouseenter();
                    $("#comodityList").bootstrapTable("resetView");
                }
            });
        },
        query: function query() {
            $("#comodityList").BTF5(this.params);
        },
        operateFormatter: function operateFormatter(value, row, index) {
            var result = '';
            result += '<div class="switch">' +
                '<input type="checkbox"  class="switchList" data-status="' + value + '" data-id="' + row.commodityId + '" data-on-color="success" data-off-color="warning"  data-size="mini" checked/></div>';
            return result;
        },
        addFormatter: function addFormatter(value, row, index) {
            var $row = JSON.stringify(row).replace(/\"/g, "'");
            var str = '<a onclick="addComodity(' + $row + ')">添加</a>';
            return str;
        },
        addMouseenter: function () {
            $(".bootstrap-table td").on("mouseenter", function () {
                if (this.offsetWidth < this.scrollWidth) {
                    var that = this;
                    var text = $(this).text();
                    layer.tips(text, that, {
                        tips: 1,
                        time: 1500
                    });
                }
            });
        }
    },
    mounted: function created() {
        this.getData();
    }
};
function count(value, row,index) {
    return index + 1;
}
/**
 * 商品组件
 */
Vue.component('my-commodity-list', commodity);


/**
 * select 插件
 * @param   options     select 中的值
 * @param   value       设置所选值
 * @param   method      更改选择的值后将触发此事件。它通过事件，clickedIndex，newValue，oldValue。
 * @param   load        调用show实例方法时会立即触发此事件。
 * @param   index       下标
 * @param   search      是否启用搜索功能
 * @param   childidx
 * @param   title       占位符
 */
Vue.component('vm-select', {
    data:function () {
      return{

      }
    },
    props: ['options', 'value', 'multiple', 'method','method1', 'load', 'index', 'search', 'childidx','title'],
    template:
    '<select :multiple="multiple" class="selectpicker" :data-live-search="search" :title="title" data-live-search-placeholder="搜索">' +
    '   <option :value="option.value" v-for="option in options" :platformCode="option.platformCode" :platformName="option.platformName">{{ option.label }}</option>' +
    '</select>',
    mounted: function () {
        var vm = this;

        $(this.$el).selectpicker('val', this.value != null ? this.value : null);
        $(this.$el).on('changed.bs.select', function () {
            vm.$emit('input', $(this).val());
            if (typeof(vm.method) != 'undefined') {
                    vm.method(vm.index, vm.childidx, this.value);
            }
            if(typeof(vm.method1) != 'undefined'){
                vm.method1($(vm.$el).get(0).options.selectedIndex, vm.options, this.value);
            }
        });
        $(this.$el).on('show.bs.select', function () {
            if (typeof(vm.load) != 'undefined') {
                vm.load(vm.index, vm.childidx);
            }
        });
    },
    updated: function () {
        $(this.$el).selectpicker('refresh');
    },
    destroyed: function () {
        $(this.$el).selectpicker('destroy');
    },
    watch:{
        'value':function (val) {
            $(this.$el).selectpicker('val', this.value != null ? this.value : null);
        }
    }
});


