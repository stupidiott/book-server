package com.mypack.book.service.account.impl;

import com.github.pagehelper.PageHelper;
import com.mypack.book.constants.EnumResponse;
import com.mypack.book.constants.EnumStatus;
import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.dto.account.AccountModifyPasswordDTO;
import com.mypack.book.dto.account.AccountResetPasswordDTO;
import com.mypack.book.dto.account.AccountSearchDTO;
import com.mypack.book.entity.EduAccount;
import com.mypack.book.exception.ModifyPasswordException;
import com.mypack.book.exception.UsernameExistException;
import com.mypack.book.mapper.AccountMapper;
import com.mypack.book.service.account.AccountService;
import ma.glasnost.orika.MapperFacade;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    private MapperFacade mapperFacade;

    @Override
    public AccountDTO queryByUsername(String username) {
        if (StringUtils.isEmpty(username)) {
            return new AccountDTO();
        }
        return accountMapper.queryByUsername(username);
    }

    @Override
    public void add(AccountDTO accountDTO) throws UsernameExistException {

        accountDTO.setCreateTime(new Date());
        accountDTO.setLastLoginTime(new Date());
        accountDTO.setStatus(EnumStatus.ACTIVE.getCode());
        // 密码MD5加密
        accountDTO.setPassword(getEncryptPassword(accountDTO.getPassword()));

        AccountDTO dbAccountDTO = accountMapper.queryByUsername(accountDTO.getUsername());
        if(dbAccountDTO != null){
            throw new UsernameExistException(EnumResponse.USERNAME_EXIST_EXCEPTION);
        }

        EduAccount eduAccount = mapperFacade.map(accountDTO, EduAccount.class);

        accountMapper.insert(eduAccount);


    }

    @Override
    public void update(AccountDTO accountDTO) {

        EduAccount eduAccount = mapperFacade.map(accountDTO, EduAccount.class);

        accountMapper.updateById(eduAccount);

    }

    @Override
    public void resetPassword(AccountResetPasswordDTO accountResetPasswordDTO) {

        EduAccount eduAccount = new EduAccount();
        eduAccount.setId(accountResetPasswordDTO.getId());
        eduAccount.setPassword(getEncryptPassword(accountResetPasswordDTO.getPassword()));

        accountMapper.updateById(eduAccount);
    }

    @Override
    public void modifyPassword(AccountModifyPasswordDTO accountModifyPasswordDTO) throws ModifyPasswordException {
        EduAccount dbAccount = accountMapper.selectById(accountModifyPasswordDTO.getId());

        if(!dbAccount.getPassword().equals(getEncryptPassword(accountModifyPasswordDTO.getOldPassword()))){
            throw new ModifyPasswordException(EnumResponse.OLD_PASSWORD_ERROR_EXCEPTION);
        }

        EduAccount eduAccount = new EduAccount();
        eduAccount.setId(accountModifyPasswordDTO.getId());
        eduAccount.setPassword(getEncryptPassword(accountModifyPasswordDTO.getNewPassword()));

        accountMapper.updateById(eduAccount);
    }

    @Override
    public List<AccountDTO> listAccount(AccountSearchDTO searchDTO, boolean isPage) {

        if (isPage) {
            PageHelper.startPage(searchDTO.getPageNum(), searchDTO.getPageSize());
        }


        List<AccountDTO> accountDTOList = accountMapper.listAccount(searchDTO);

        if (CollectionUtils.isEmpty(accountDTOList)) {
            return accountDTOList;
        }

        return accountDTOList;

    }

    private String getEncryptPassword(String password) {
        return DigestUtils.md5DigestAsHex(password.getBytes());
    }

}
