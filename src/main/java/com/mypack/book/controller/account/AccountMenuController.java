package com.mypack.book.controller.account;

import com.mypack.book.context.SessionContext;
import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.service.account.menu.AccountMenuService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/account")
public class AccountMenuController {

    @Autowired
    private AccountMenuService accountMenuService;


    @RequestMapping("/menu")
    public Result queryMenu() {
        AccountDTO currentUser = SessionContext.getCurrentUser();
        return ResultUtils.success(accountMenuService.queryAccountMenu(currentUser.getAccountType()));
    }

    @RequestMapping("/type")
    public Result queryAccountType() {
        AccountDTO currentUser = SessionContext.getCurrentUser();
        return ResultUtils.success(currentUser.getAccountType());
    }
}
