/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements. See the NOTICE file distributed with this
 * work for additional information regarding copyright ownership. The ASF
 * licenses this file to You under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.onflapp.rested.filters;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.servlets.post.AbstractPostResponse;
import org.apache.sling.servlets.post.PostResponse;
import org.apache.sling.servlets.post.PostResponseCreator;

class MyPOSTResponse extends AbstractPostResponse {
	private SlingHttpServletRequest request;
	public MyPOSTResponse (SlingHttpServletRequest req) {
		request = req;
	}
	public void onChange (String type, String... arguments) {
		System.out.println (">>>" + type);
	}

	@Override
	protected void doSend (HttpServletResponse response) throws IOException {
		if (isSuccessful () == false) {
		}
		/*
		String forward = request.getParameter(":forward");
		String redirect = request.getParameter(":redirect");

			response.sendRedirect("http://localhost:8080" + redirect);
		}
		else {
		}
		*/
	}

	/*
		try {
			Resource res = request.getResourceResolver().getResource(forward);

		System.out.println (">>>" + forward + ":" + res);
			javax.servlet.RequestDispatcher disp = request.getRequestDispatcher (res);
			disp.forward(request, response);
		}
		catch (ServletException ex) {
			
		}
		System.out.println ("send:" + isSuccessful ());
		response.setContentType ("text/html");
		response.setCharacterEncoding ("UTF-8");

		response.getWriter().write ("Thanks!");
		response.getWriter().flush();
		*/
}

@Component
@Service
public class MyResponse implements PostResponseCreator {

	public PostResponse createPostResponse (SlingHttpServletRequest req) {
		return null;//new MyPOSTResponse (req);
	}
}

