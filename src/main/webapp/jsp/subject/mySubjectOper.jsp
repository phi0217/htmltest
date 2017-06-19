<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>会计科目操作列表</title>
    <link rel="stylesheet" href="/css/common/common.css"/>
    <script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/js/common/common.js"></script>
</head>

<body>
<div class="main">
    <div class="title">
        <h3>当前位置：<span>会计科目 > 会计科目操作列表</span></h3>
    </div>
    <!--table start-->
    <div class="table-container">
        <!--table list-->
        <div class="table">
            <table>
                <tr>
                    <th>序号</th>
                    <th>操作类型</th>
                    <th>操作序列号</th>
                    <th>参数编号</th>
                    <th>会计科目名称</th>
                    <th>会计科目代码</th>
                    <th>上级会计科目名称</th>
                    <th>上级会计科目代码</th>
                    <th>会计科目级别</th>
                    <th>会计科目余额方向</th>
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
                        <button class="btn modifyNew">修改</button>
                        <a href="/subject/deleteSubjectNew/todo" class="btn delete">删除</a>
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
                        <button class="btn modifyUpdate">修改</button>
                        <a href="/subject/deleteSubjectUpdate/todo" class="btn delete">删除</a>
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
                        <a href="/subject/deleteSubjectDrop/todo" class="btn delete">删除</a>
                    </td>
                </tr>

            </table>
        </div>
    </div>
    <!--table end-->
</div>
<!--------------------------新增录入修改弹出框-------------------------------------->
<div class="input" id="modifyNewBox">
    <form action="/subject/modifySubjectNew" method="post">
        <h1>新增会计科目修改<span class="close">×</span></h1>
        <ul>
            <li><span>会计科目名称：</span><input name="subjectName" type="text"/></li>
            <li>
                <span>会计科目级别：</span>
                <select name="subjectLevel" class="subjectLevel">
                    <option></option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </li>
            <li><span>会计科目代码：</span><input name="subjectCode" class="subjectCode" type="text"/></li>
            <li><span>上级会计科目代码：</span><input class="superiorSubjectCode" type="text" readonly="readonly"
                                             style="background-color:#ededed"/></li>
            <li>
                <span>是否有下级科目：</span>
                <select name="hasSubSubjectFlag" class="hasSubSubjectFlag">
                    <option></option>
                    <option value="1">有</option>
                    <option value="2">没有</option>
                </select>
            </li>

            <li>
                <span>会计科目余额方向：</span>
                <select name="subjectBalanceDirection">
                    <option></option>
                    <option value="0">双向</option>
                    <option value="1">借方</option>
                    <option value="2">贷方</option>
                </select>
            </li>

            <li>
                <span>会计科目类型：</span>
                <select name="subjectType">
                    <option></option>
                    <option value="1">表内</option>
                    <option value="2">表外</option>
                </select>
            </li>

            <li>
                <span>科目权限类型：</span>
                <select name="subjectAuthorityType">
                    <option></option>
                    <option value="1">全局</option>
                    <option value="2">私有</option>
                </select>
            </li>

            <li>
                <span>备注：</span>
                <textarea name="remark"></textarea>
            </li>
        </ul>
        <button class="btn" type="submit">提交</button>
    </form>
    <div class="inputMask"></div>
</div>

<!---------------------------变更录入修改弹出框-------------------------->
<div class="input" id="modifyUpdateBox">
    <form action="/subject/modifySubjectUpdate" method="post">
        <h1>新增会计科目录入修改<span class="close">×</span></h1>
        <ul>
            <li>
                <span>会计科目余额方向：</span>
                <select name="subjectBalanceDirection">
                    <option></option>
                    <option value="0">双向</option>
                    <option value="1">借方</option>
                    <option value="2">贷方</option>
                </select>
            </li>
            <li>
                <span>会计科目名称：</span>
                <input name="subjectName" type="text"/>
            </li>
            <li>
                <span>是否有下级科目：</span>
                <select name="hasSubSubjectFlag">
                    <option></option>
                    <option value="1">有</option>
                    <option value="2">没有</option>
                </select>
            </li>
            <li>
                <span>备注：</span>
                <textarea></textarea>
            </li>
        </ul>
        <div class="btns">
            <button class="btn submit" type="submit">确定</button>
            <button class="btn close" type="button">取消</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="/js/subject/subject.js"></script>
</body>

</html>