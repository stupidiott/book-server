package com.mypack.book.service.account;

import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.dto.account.AccountModifyPasswordDTO;
import com.mypack.book.dto.account.AccountResetPasswordDTO;
import com.mypack.book.dto.account.AccountSearchDTO;
import com.mypack.book.exception.ModifyEmailException;
import com.mypack.book.exception.ModifyPasswordException;
import com.mypack.book.exception.UsernameExistException;

import java.util.List;

public interface AccountService {

    AccountDTO queryByUsername(String username);

    List<AccountDTO> listAccount(AccountSearchDTO searchDTO, boolean isPage);

    void add(AccountDTO accountDTO) throws UsernameExistException;

    void update(AccountDTO accountDTO);

    void resetPassword(AccountResetPasswordDTO accountResetPasswordDTO);

    void modifyPassword(AccountModifyPasswordDTO accountModifyPasswordDTO) throws ModifyPasswordException;


    void resetEmail(AccountDTO accountResetEmailDTO);

    void modifyEmail(AccountDTO accountModifyEmailDTO) throws ModifyEmailException;
}
