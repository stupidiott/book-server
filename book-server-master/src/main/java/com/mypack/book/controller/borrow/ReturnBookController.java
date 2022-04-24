package com.mypack.book.controller.borrow;

import com.mypack.book.constants.EnumResponse;
import com.mypack.book.dto.returnBook.ReturnBookDTO;
import com.mypack.book.service.returnBook.ReturnBookService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReturnBookController {

    @Autowired
    private ReturnBookService returnBookService;

    @RequestMapping("/return/book")
    public Result returnBook(@RequestBody ReturnBookDTO returnBookDTO) {

        if (returnBookDTO.getBorrowBookId() == null || StringUtils.isEmpty(returnBookDTO.getBookNo())) {
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }

        returnBookService.returnBook(returnBookDTO.getBorrowBookId(), returnBookDTO.getBookNo());

        return ResultUtils.success();
    }


}
