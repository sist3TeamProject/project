# 웹사이트
[웹사이트 바로가기](http:localhost:8080/web/ "팀 프로젝트")

## jstl 시큐리티 관련 설명

### 게스트

	<sec:authorize access="isAnonymous()">
		<div>게스트만 보입니다.</div>
	</sec:authorize>

### 로그인

	<sec:authorize access="isAuthenticated()">
		<div>로그인한 계정만 보입니다.</div>
	</sec:authorize>

### 일반 회원

	<sec:authorize access="hasRole('ROLE_USER')">
		<div>일반 회원만 보입니다.</div>
	</sec:authorize>

### 관리자

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div>관리자만 보입니다.</div>
	</sec:authorize>
	
----------------

### 계정 닉네임이나 정보가 필요한 경우 아래처럼 정보를 가져와 MemberDTO사용

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/test.do")
	public String test(HttpSession session) {
		MemberDTO memberDTO = memberService.selectMember((Integer) session.getAttribute("memberIdx"));
	}
	