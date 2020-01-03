#IMAGE GALLERY PROJECT
*2020-01-03
### WYSWYG(WHAT YOU SEE WHAT YOU GET) EDITOR
*SUMMERNOTE : https://summernote.org/

* textarea에 id값을 설정하고 id에 jquery를 이용 속성 설정시 간편하게 WYSWYG 방식으로
문서 작성 가능

### drag & drop으로 파일 올리기
* drag and drop 수행할 박스를 만들기
* jquery drag over drop event 설정
* e.orignal.Evant.DataTranfer로부터 files 객체 추출
* files 객체에서 [0] 파일 객체를 추출

* ajax를 통해 서버로 파일을 업로드 수행
* 파일 이름등을 response로 받기
* form img_file input box에 저장
* 내용을 form post로 업로드하고 DB에 저장