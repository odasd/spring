/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2020-06-24 06:17:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.reply;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("jar:file:/C:/data/spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ex05/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1592786290475L));
    _jspx_dependants.put("jar:file:/C:/data/spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ex05/WEB-INF/lib/jstl-1.2.jar!/META-INF/fmt.tld", Long.valueOf(1153352682000L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>댓글목록</title>\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-1.9.1.js\"></script>\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("#divReply {\r\n");
      out.write("\twidth: 490px;\r\n");
      out.write("\tborder: 1px solid gray;\r\n");
      out.write("\tpadding: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header {\r\n");
      out.write("\tbackground: gray;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".replydate {\r\n");
      out.write("\tfloat: right;\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".replyer {\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#pagination {\r\n");
      out.write("\twidth: 490px;\r\n");
      out.write("\tborder: 1px solid gray;\r\n");
      out.write("\tpadding: 5px;\r\n");
      out.write("\tmargin-top: 10px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a {\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tcolor: green;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".active {\r\n");
      out.write("\tcolor: red;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"divReply\">\r\n");
      out.write("\t\t<div class=\"header\">\r\n");
      out.write("\t\t\t댓글목록<span id=\"total\"></span> <span style=\"float: right\"><button\r\n");
      out.write("\t\t\t\t\tid=\"btnReplyOpen\">댓글쓰기</button></span>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"replies\"></div>\r\n");
      out.write("\t\t<script id=\"temp\" type=\"text/x-handlebars-template\"> \r\n");
      out.write("\t\t{{#each array}}\r\n");
      out.write("\t\t\t<div rno={{rno}}>{{rno}}\r\n");
      out.write("\t\t\t\t<span class=\"replyer\">{{replyer}}</span>\r\n");
      out.write("\t\t\t\t<span class=\"replydate\">{{replydate}}</span>\r\n");
      out.write("\t\t\t\t<span class=\"reply\">{{reply}}</span>\r\n");
      out.write("\t\t\t\t<div><button class=\"btnUpdate\">수정</button></div> \r\n");
      out.write("\t\t\t\t<hr style=\"border:0.5px dotted gray;\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t{{/each}}\r\n");
      out.write("\t</script>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"pagination\"></div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("\tvar page = 1;\r\n");
      out.write("\tvar bno=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vo.bno}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("\tgetList();\r\n");
      out.write("\r\n");
      out.write("\tfunction getList() {\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\ttype : \"get\",\r\n");
      out.write("\t\t\turl : \"/reply/list.json\",\r\n");
      out.write("\t\t\tdata:{\"page\":page, \"bno\":bno},\r\n");
      out.write("\t\t\tdataType : \"json\",\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\tvar temp = Handlebars.compile($(\"#temp\").html());\r\n");
      out.write("\t\t\t\t$(\"#replies\").html(temp(data));\r\n");
      out.write("\t\t\t\t//페이지 리스트 출력\r\n");
      out.write("\t\t\t\tvar str = \"\";\r\n");
      out.write("\t\t\t\tif (data.pm.prev) {\r\n");
      out.write("\t\t\t\t\tstr += \"<a href='\" + (data.pm.startPage - 1) + \"'>◀</a>\"\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tfor (var i = data.pm.startPage; i <= data.pm.endPage; i++) {\r\n");
      out.write("\t\t\t\t\tif (page == i) {\r\n");
      out.write("\t\t\t\t\t\tstr += \"[<a href='\" + i + \"' class='active'>\" + i\r\n");
      out.write("\t\t\t\t\t\t\t\t+ \"</a>]\";\r\n");
      out.write("\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\tstr += \"[<a href='\" + i + \"'>\" + i + \"</a>]\";\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (data.pm.next) {\r\n");
      out.write("\t\t\t\t\tstr += \"<a href='\" + (data.pm.endPage + 1) + \"'>▶</a>\"\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t$(\"#pagination\").html(str);\r\n");
      out.write("\t\t\t\t//전체 데이타 출력     \r\n");
      out.write("\t\t\t\t$(\"#total\").html(data.pm.totalCount);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t//페이지 번호를 클릭했을 경우   \r\n");
      out.write("\t$(\"#pagination\").on(\"click\", \"a\", function(e){  \r\n");
      out.write("\t\te.preventDefault();  \r\n");
      out.write("\t\tpage = $(this).attr(\"href\"); \r\n");
      out.write("\t\tgetList();\r\n");
      out.write("\t\t});\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
