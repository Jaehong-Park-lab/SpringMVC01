package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	//HanderMapping
	@RequestMapping("/boardList")
	public String boardList(Model model) {
		
		List<Board>list = mapper.getLists();
//		Board vo = new Board();
//		vo.setIdx(1);
//		vo.setTitle("게시판실습");
//		vo.setContent("게시판실습");
//		vo.setWriter("박매일");
//		vo.setIndate("2023-10-29");
//		vo.setCount(0);
//		
//		List<Board> list = new ArrayList<Board>();
//		list.add(vo);
//		list.add(vo);
//		list.add(vo);
		model.addAttribute("list", list);
		return "boardList";	
	}
	
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm"; //WEB-INF/VIEWS/boardForm.jsp ->forward
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) { //title, content, writer => 파라메터 수집(Board)
		mapper.boardInsert(vo);
		return "redirect:/boardList.do"; //redirect
	}
	
	@GetMapping("/boardContent.do")
	public String boardContent(@RequestParam("idx") int idx, Model model) {// ?idx=6
		Board vo = mapper.boardContent(idx);
		//조회수 증가
		mapper.boardCount(idx);
		model.addAttribute("vo", vo); //${}
		return "boardContent";
	}
	
	@GetMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int idx) { // ?idx=6
		mapper.boardDelete(idx); //삭제
		return "redirect:/boardList.do";
	}
	
	@GetMapping("/boardUpdateForm.do/{idx}")
	public String boardUpdateForm(@PathVariable("idx") int idx, Model model) {
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo", vo);
		
		return "boardUpdate";
	}
	
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		mapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}

}
