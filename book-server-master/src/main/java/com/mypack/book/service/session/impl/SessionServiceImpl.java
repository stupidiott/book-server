package com.mypack.book.service.session.impl;

import com.alibaba.fastjson.JSON;
import com.mypack.book.constants.EnumResponse;
import com.mypack.book.constants.EnumStatus;
import com.mypack.book.context.SessionContext;
import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.entity.EduAccountLogin;
import com.mypack.book.exception.LoginException;
import com.mypack.book.mapper.AccountLoginMapper;
import com.mypack.book.service.account.AccountService;
import com.mypack.book.service.session.SessionService;
import lombok.extern.slf4j.Slf4j;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.Date;

@Slf4j
@Service
@Transactional
public class SessionServiceImpl implements SessionService {

    @Autowired
    private AccountService accountService;
    @Autowired
    private AccountLoginMapper accountLoginMapper;

    @Override
    public String login(String username, String password) throws LoginException {

        AccountDTO accountDTO = accountService.queryByUsername(username);

        if (accountDTO == null) {
            throw new LoginException(EnumResponse.NOT_EXIST_USER);
        }

        if (EnumStatus.INACTIVE.getCode().equals(accountDTO.getStatus())) {
            throw new LoginException(EnumResponse.LOGIN_INVALID_STATUS);
        }

        if (DigestUtils.md5DigestAsHex(password.getBytes()).equals(accountDTO.getPassword())) {
            log.info("{}账号校验成功！", accountDTO.getUsername());

            String token = System.currentTimeMillis() + "";

            EduAccountLogin eduAccountLogin = new EduAccountLogin();

            eduAccountLogin.setToken(token);
            eduAccountLogin.setUsername(accountDTO.getUsername());
            eduAccountLogin.setUserInfo(JSON.toJSONString(accountDTO));
            eduAccountLogin.setCreateTime(new Date());

            accountLoginMapper.insert(eduAccountLogin);

            // 最后一次登录时间
            accountDTO.setLastLoginTime(new Date());
            accountService.update(accountDTO);

            SessionContext.setCurrentUser(accountDTO);

            return token;
        } else {
            throw new LoginException(EnumResponse.FAIL);
        }

    }
}
