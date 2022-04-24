package com.mypack.book.service.http.impl;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.mypack.book.filter.RequestWrapper;
import com.mypack.book.service.http.RequestService;
import com.mypack.book.utils.HttpUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.Map;

@Service
public class RequestServiceImpl implements RequestService {

    @Override
    public String getRequestBody(HttpServletRequest request) {

        String body = null;

        if (HttpUtils.isRequestBody(request)) {
            RequestWrapper requestWrapper = new RequestWrapper(request);
            body = requestWrapper.getBody();
        }

        if (StringUtils.isEmpty(body)) {
            // 针对非requestBody接收参数的请求。
            Map<String, Object> parameterMap = Maps.newHashMap();
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String name = parameterNames.nextElement();
                parameterMap.put(name, request.getParameter(name));
            }
            body = JSON.toJSONString(parameterMap);
        }

        return body;
    }
}
