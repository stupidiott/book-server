package com.mypack.book.service.http;

import javax.servlet.http.HttpServletRequest;

public interface RequestService {

    String getRequestBody(HttpServletRequest request);


}
