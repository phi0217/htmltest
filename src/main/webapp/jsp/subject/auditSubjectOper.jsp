<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>会计科目复核</title>
    <link rel="stylesheet" href="/css/common/common.css"/>
    <script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/js/common/common.js"></script>
</head>

<body>
<div class="main">
    <div class="title">
        <h3>当前位置：<span>会计科目 > 新增会计科目复核</span></h3>
    </div>
    <!--table start-->
    <div class="table-container">
        <!--table list-->
        <div class="table">
            <table>
                <tr>
                    <th>序号</th>
                    <th>操作序列号</th>
                    <th>参数编号</th>
                    <th>会计科目名称</th>
                    <th>会计科目代码</th>
                    <th>上级会计科目名称</th>
                    <th>上级会计科目代码</th>
                    <th>会计科目级别</th>
                    <th>会计科目余额方向</th>
                    <th>操作类型</th>
                    <th>会计科目类型</th>
                    <th>科目权限类型</th>
                    <th>执行操作状态</th>
                    <th>录入人姓名</th>
                    <th>录入人代码</th>
                    <th>录入时间</th>
                    <th>核准人姓名</th>
                    <th>核准人代码</th>
                    <th>核准时间</th>
                    <th>科目所有者</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>

                <tr>
                    <td>01</td>
                    <td>新增</td>
                    <td>操作序列号</td>
                    <td>参数编号</td>
                    <td>会计科目名称</td>
                    <td>会计科目代码</td>
                    <td>上级会计科目名称</td>
                    <td>上级会计科目代码</td>
                    <td>会计科目级别</td>
                    <td>会计科目余额方向</td>
                    <td>会计科目类型</td>
                    <td>科目权限类型</td>
                    <td>执行操作状态</td>
                    <td>录入人姓名</td>
                    <td>录入人代码</td>
                    <td>录入时间</td>
                    <td>核准人姓名</td>
                    <td>核准人代码</td>
                    <td>核准时间</td>
                    <td>科目所有者</td>
                    <td>备注</td>
                    <td>
                        <button class="auditNew btn ">复核</button>
                    </td>
                </tr>

                <tr>
                    <td>02</td>
                    <td>变更</td>
                    <td>操作序列号</td>
                    <td>参数编号</td>
                    <td>会计科目名称</td>
                    <td>会计科目代码</td>
                    <td>上级会计科目名称</td>
                    <td>上级会计科目代码</td>
                    <td>会计科目级别</td>
                    <td>会计科目余额方向</td>
                    <td>会计科目类型</td>
                    <td>科目权限类型</td>
                    <td>执行操作状态</td>
                    <td>录入人姓名</td>
                    <td>录入人代码</td>
                    <td>录入时间</td>
                    <td>核准人姓名</td>
                    <td>核准人代码</td>
                    <td>核准时间</td>
                    <td>科目所有者</td>
                    <td>备注</td>
                    <td>
                        <button class="auditUpdate btn ">复核</button>
                    </td>
                </tr>

                <tr>
                    <td>03</td>
                    <td>注销</td>
                    <td>操作序列号</td>
                    <td>参数编号</td>
                    <td>会计科目名称</td>
                    <td>会计科目代码</td>
                    <td>上级会计科目名称</td>
                    <td>上级会计科目代码</td>
                    <td>会计科目级别</td>
                    <td>会计科目余额方向</td>
                    <td>会计科目类型</td>
                    <td>科目权限类型</td>
                    <td>执行操作状态</td>
                    <td>录入人姓名</td>
                    <td>录入人代码</td>
                    <td>录入时间</td>
                    <td>核准人姓名</td>
                    <td>核准人代码</td>
                    <td>核准时间</td>
                    <td>科目所有者</td>
                    <td>备注</td>
                    <td>
                        <a href="/subject/auditSubjectDrop/todo" class="btn ">复核</a>
                    </td>
                </tr>

            </table>
        </div>
    </div>
    <!--table end-->
</div>

<div class="mask" id="auditNewmask">


    <!--新增复核弹出框-->
    <div class="modal" id="auditNewBox">
        <form action="/subject/auditSubjectNew" method="post">
            <div class="modal-head">
                <h3>新增会计科目修改</h3>
                <a href="javascript:;" class="close">×</a>
            </div>
            <div class="modal-body">
                <div class="title">
                    <h3>原始数据</h3>
                    <h3>复核数据</h3>
                </div>
                <!---------------------------左侧原始数据--------------------------->
                <div class="left">
                    <div class="item">
                        <input name="subjectName" type="text" disabled="disabled"/>
                        <span>会计科目名称：</span>
                    </div>
                    <div class="item">
                        <select name="subjectLevel" disabled="disabled">
                            <option></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                        <span>会计科目级别：</span>
                    </div>
                    <div class="item">
                        <input name="subjectCode" type="text" disabled="disabled"/>
                        <span>会计科目代码：</span>
                    </div>
                    <div class="item">
                        <input name="superiorSubjectCode" type="text" disabled="disabled"/>
                        <span>上级会计科目代码：</span>
                    </div>
                    <div class="item">
                        <select name="subjectBalanceDirection" disabled="disabled">
                            <option></option>
                            <option value="0">双向</option>
                            <option value="1">借方</option>
                            <option value="2">贷方</option>
                        </select>
                        <span>会计科目余额方向：</span>
                    </div>
                    <div class="item">
                        <select name="hasSubSubjectFlag" disabled="disabled">
                            <option></option>
                            <option value="1">有</option>
                            <option value="2">没有</option>
                        </select>
                        <span>是否有下级科目：</span>
                    </div>
                    <div class="item">
                        <select name="subjectType" disabled="disabled">
                            <option></option>
                            <option value="1">表内</option>
                            <option value="2">表外</option>
                        </select>
                        <span>会计科目类型：</span>
                    </div>
                    <div class="item" name="subjectAuthorityType">
                        <select name="subjectAuthorityType" disabled="disabled">
                            <option></option>
                            <option value="1">全局</option>
                            <option value="2">私有</option>
                        </select>
                        <span>科目权限类型：</span>
                    </div>
                    <div class="item">
                        <textarea name="remark" disabled="disabled"></textarea>
                        <span>备注：</span>
                    </div>
                </div>
                <!------------------------右侧手动复核数据-------------------------->
                <div class="right">
                    <div class="item">
                        <input name="subjectName" type="text"/>
                        <span>会计科目名称：</span>
                    </div>
                    <div class="item">
                        <select name="subjectLevel" class="subjectLevel">
                            <option></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                        <span>会计科目级别：</span>
                    </div>
                    <div class="item">
                        <input name="subjectCode" type="text" class="subjectCode"/>
                        <span>会计科目代码：</span>
                    </div>
                    <div class="item">
                        <input name="superiorSubjectCode" class="superiorSubjectCode" type="text"/>
                        <span>上级会计科目代码：</span>
                    </div>
                    <div class="item">
                        <select name="subjectBalanceDirection">
                            <option></option>
                            <option value="0">双向</option>
                            <option value="1">借方</option>
                            <option value="2">贷方</option>
                        </select>
                        <span>会计科目余额方向：</span>
                    </div>
                    <div class="item">
                        <select name="hasSubSubjectFlag" class="hasSubSubjectFlag">
                            <option></option>
                            <option value="1">有</option>
                            <option value="2">没有</option>
                        </select>
                        <span>是否有下级科目：</span>
                    </div>
                    <div class="item">
                        <select name="subjectType">
                            <option></option>
                            <option value="1">表内</option>
                            <option value="2">表外</option>
                        </select>
                        <span>会计科目类型：</span>
                    </div>
                    <div class="item">
                        <select name="subjectAuthorityType">
                            <option></option>
                            <option value="1">全局</option>
                            <option value="2">私有</option>
                        </select>
                        <span>科目权限类型：</span>
                    </div>
                    <div class="item">
                        <textarea name="remark"></textarea>
                        <span>备注：</span>
                    </div>
                </div>
            </div>
            <div class="modal-foot">
                <button class="btn submit" type="submit">确定</button>
                <button class="btn close" type="button">取消</button>
            </div>
        </form>
    </div>
</div>
<div class="mask" id="auditUpdatemask">
    <%--变更复核弹出框--%>
    <div class="modal" id="auditUpdate">
        <form action="/subject/auditSubjectUpdate" method="post">
            <div class="modal-head">
                <h3>变更会计科目修改</h3>
                <a href="javascript:;" class="close">×</a>
            </div>
            <div class="modal-body">
                <div class="title">
                    <h3>原始数据</h3>
                    <h3>复核数据</h3>
                </div>
                <!---------------------------左侧原始数据--------------------------->
                <div class="left">
                    <div class="item">
                        <input name="subjectName" type="text" disabled="disabled"/>
                        <span>会计科目名称：</span>
                    </div>
                    <div class="item">
                        <select name="subjectBalanceDirection" disabled="disabled">
                            <option></option>
                            <option value="0">双向</option>
                            <option value="1">借方</option>
                            <option value="2">贷方</option>
                        </select>
                        <span>会计科目余额方向：</span>
                    </div>
                    <div class="item">
                        <select name="hasSubSubjectFlag" disabled="disabled">
                            <option></option>
                            <option value="1">有</option>
                            <option value="2">没有</option>
                        </select>
                        <span>是否有下级科目：</span>
                    </div>
                    <div class="item">
                        <textarea name="remark" disabled="disabled"></textarea>
                        <span>备注：</span>
                    </div>
                </div>
                <!------------------------右侧手动复核数据-------------------------->
                <div class="right">
                    <div class="item">
                        <input name="subjectName" type="text"/>
                        <span>会计科目名称：</span>
                    </div>
                    <div class="item">
                        <select name="subjectBalanceDirection">
                            <option></option>
                            <option value="0">双向</option>
                            <option value="1">借方</option>
                            <option value="2">贷方</option>
                        </select>
                        <span>会计科目余额方向：</span>
                    </div>
                    <div class="item">
                        <select name="hasSubSubjectFlag">
                            <option></option>
                            <option value="1">有</option>
                            <option value="2">没有</option>
                        </select>
                        <span>是否有下级科目：</span>
                    </div>
                    <div class="item">
                        <textarea name="remark"></textarea>
                        <span>备注：</span>
                    </div>
                </div>
            </div>
            <div class="modal-foot">
                <button class="btn submit" type="submit">确定</button>
                <button class="btn close" type="button">取消</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    //--------------------------新增复核弹出框---------------------------
    //表格点击复核
    $(".auditNew").click(function(){
        $('#auditNewmask').fadeIn(50);
    });


    //--------------------------变更复核弹出框---------------------------
    //表格点击复核
    $(".auditUpdate").click(function(){
        $("#auditUpdatemask").fadeIn(50);
    });

    //close modal
    $('.close').click(function(){
        $(this).parents('.mask').hide(50);
    });
</script>
<script type="text/javascript" src="/js/subject/subject.js"></script>
</body>
</html>