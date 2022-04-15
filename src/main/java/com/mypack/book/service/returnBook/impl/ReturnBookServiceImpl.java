package com.mypack.book.service.returnBook.impl;

import com.mypack.book.constants.EnumDeleteFlag;
import com.mypack.book.dto.borrow.BorrowBookDTO;
import com.mypack.book.service.book.BookService;
import com.mypack.book.service.borrow.BorrowBookService;
import com.mypack.book.service.returnBook.ReturnBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class ReturnBookServiceImpl implements ReturnBookService {

    @Autowired
    private BorrowBookService borrowBookService;
    @Autowired
    private BookService bookService;

    @Override
    @Transactional
    public void returnBook(Integer borrowBookId, String bookNo) {

        BorrowBookDTO borrowBookDTO = new BorrowBookDTO();
        borrowBookDTO.setId(borrowBookId);
        borrowBookDTO.setDeleteFlag(EnumDeleteFlag.YES.getCode());
        borrowBookDTO.setReturnTime(new Date());

        borrowBookService.update(borrowBookDTO);

        // 变更图书状态
        bookService.updateStatusByBookNo(bookNo,1);
    }
}
