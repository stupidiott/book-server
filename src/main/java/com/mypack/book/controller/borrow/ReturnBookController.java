package com.mypack.book.controller.borrow;

import com.mypack.book.constants.EnumResponse;
import com.mypack.book.dto.account.AccountDTO;
import com.mypack.book.dto.account.menu.PayDTO;
import com.mypack.book.dto.borrow.BorrowBookDTO;
import com.mypack.book.dto.returnBook.ReturnBookDTO;
import com.mypack.book.service.borrow.BorrowBookService;
import com.mypack.book.service.returnBook.ReturnBookService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
public class ReturnBookController {

    @Autowired
    private ReturnBookService returnBookService;

    @Autowired
    private BorrowBookService borrowBookService;

    @RequestMapping("/return/book")
    public Result returnBook(@RequestBody ReturnBookDTO returnBookDTO) {

        if (returnBookDTO.getBorrowBookId() == null || StringUtils.isEmpty(returnBookDTO.getBookNo())) {
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }

        returnBookService.returnBook(returnBookDTO.getBorrowBookId(), returnBookDTO.getBookNo());

        return ResultUtils.success();
    }

    @PostMapping(value = "/return/expiredbook")
    public Result returnExpiredbook(@RequestBody PayDTO payDTO){
        List<BorrowBookDTO> list = borrowBookService.listByUsername(payDTO.getName());
        for (BorrowBookDTO bookDTO : list) {
            if (bookDTO.getReturnTime() == null && new Date().getTime() > bookDTO.getEndTime().getTime()){
                returnBookService.returnBook(bookDTO.getId(),bookDTO.getBookNo());
            }
        }
        return ResultUtils.success();
    }

}
