package kr.co.pk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.pk.service.BoardService;

//깃 허브에서 주석
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
}
