function sel_all(frm){ //전체 데이터 조회
		frm.action = "selectAll.jsp";
		frm.submit();		
	}
	
	function sel_one(frm) { //ID로 검색
		frm.action = "selectOneID.jsp";
		frm.submit();	
	}