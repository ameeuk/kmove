package customTag;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class Shading extends SimpleTagSupport{
	public void doTag() throws JspException, IOException{
		JspContext context = getJspContext();
		JspWriter out = context.getOut();
		out.println("<center>==================</center>");
		return;
	}

}
