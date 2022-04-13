package com.mypack.book.controller.login;

import com.mypack.book.constants.EnumResponse;
import com.mypack.book.dto.LoginDTO;
import com.mypack.book.dto.LogoutDTO;
import com.mypack.book.exception.LoginException;
import com.mypack.book.service.session.SessionService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@Slf4j
public class SessionController {

    @Autowired
    private SessionService sessionService;

    @RequestMapping("/login")
    public Result login(@RequestBody LoginDTO loginDTO) {

        if(StringUtils.isEmpty(loginDTO.getUsername()) || StringUtils.isEmpty(loginDTO.getPassword())){
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }

        try {
            String token = sessionService.login(loginDTO.getUsername(),loginDTO.getPassword());
            return ResultUtils.success(token);
        } catch (LoginException e) {
            log.error("登录异常！",e);
            return ResultUtils.fail(e.getEnumResponse());
        }
    }

    @RequestMapping("/logout")
    public Result logout(@RequestBody LogoutDTO logoutDTO) {
        return ResultUtils.success();
    }

}
