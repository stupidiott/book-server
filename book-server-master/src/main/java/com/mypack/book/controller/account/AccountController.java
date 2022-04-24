package com.mypack.book.controller.account;

import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageInfo;
import com.mypack.book.constants.EnumResponse;
import com.mypack.book.context.SessionContext;
import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.dto.account.AccountModifyPasswordDTO;
import com.mypack.book.dto.account.AccountResetPasswordDTO;
import com.mypack.book.dto.account.AccountSearchDTO;
import com.mypack.book.exception.ModifyPasswordException;
import com.mypack.book.exception.UsernameExistException;
import com.mypack.book.service.account.AccountService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;


    /**
     * 查询账号信息
     */
    @RequestMapping("/list")
    public Result list(@RequestBody AccountSearchDTO searchDTO) {

        List<AccountDTO> accountDTOList = accountService.listAccount(searchDTO, true);

        accountDTOList.forEach(item->item.setPassword(null));

        PageInfo pageInfo = new PageInfo(accountDTOList);

        return ResultUtils.success(pageInfo);
    }

    /**
     * 查询账号信息
     */
    @RequestMapping("/query")
    public Result query() {
        AccountDTO accountDTO = SessionContext.getCurrentUser();
        accountDTO.setPassword(null);
        return ResultUtils.success(SessionContext.getCurrentUser());
    }

    @RequestMapping("/add")
    public Result add(@RequestBody AccountDTO accountDTO) {

        if (StrUtil.isEmpty(accountDTO.getUsername()) || StrUtil.isEmpty(accountDTO.getPassword())) {
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }

        try {
            accountService.add(accountDTO);
        } catch (UsernameExistException e) {
            return ResultUtils.fail(e.getEnumResponse());
        }

        return ResultUtils.success();
    }

    @RequestMapping("/update")
    public Result update(@RequestBody AccountDTO accountDTO) {

        accountService.update(accountDTO);

        return ResultUtils.success();
    }

    @RequestMapping("/reset/status")
    public Result resetStatus(@RequestBody AccountDTO accountDTO) {

        accountService.update(accountDTO);

        return ResultUtils.success();
    }

    @RequestMapping("/reset/password")
    public Result resetPassword(@RequestBody AccountResetPasswordDTO accountResetPasswordDTO) {

        if (accountResetPasswordDTO.getId() == null || StrUtil.isEmpty(accountResetPasswordDTO.getPassword())) {
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }

        accountService.resetPassword(accountResetPasswordDTO);

        return ResultUtils.success();
    }

    @RequestMapping("/modify/password")
    public Result modifyPassword(@RequestBody AccountModifyPasswordDTO accountModifyPasswordDTO) {

        if (StrUtil.isEmpty(accountModifyPasswordDTO.getOldPassword()) || StrUtil.isEmpty(accountModifyPasswordDTO.getNewPassword())) {
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }
        // 设置当前账号ID
        accountModifyPasswordDTO.setId(SessionContext.getAccountId());

        try {
            accountService.modifyPassword(accountModifyPasswordDTO);
        } catch (ModifyPasswordException e) {
            return ResultUtils.fail(e.getEnumResponse());
        }

        return ResultUtils.success();
    }

}
