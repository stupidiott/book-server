package com.mypack.book.service.session;

import com.mypack.book.exception.LoginException;

public interface SessionService {

    String login(String username,String password) throws LoginException;

}
