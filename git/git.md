# git에 대해 정리
## Git에 3가지 영역   
1. working directory   
   실제 작업을 하는 공간
2. staging area   
   git add를 한 것들이 있는 공간
3. repository   
   working directory의 변경 이력들이 저장되어 있는 영역

## Git에 파일의 4가지 상태   
Git에서 관리하는 파일은 `상태(status)`를 가진다.   
- Untracked 상태   
  파일이 Git에 의해서 그 변동사항이 전혀 추적되고 있지 않는 상태   
  ex) 파일을 새로 생성하고 그 파일을 한 번도 git add해주지 않았다면 이 상태
- Tracked 상태
  파일이 Git에 의해 변동사항이 추적되고 있는 상태(크게 3가지로 나뉨)   
  
    1. Staged 상태   
    파일의 내용이 수정되고 나서, `staging area`에 올라와있는 상태
    ex) 새로 생성한 파일에 내용을 쓰고 git add를 하거나 한 번이라도 커밋에 포함됐었던 파일이라도 내용을 수정하고 git add를 해주었을 때

    2. Unmodified 상태   
    현재 파일의 내용이 최신 커밋의 모습과 비교했을 때 전혀 바뀐 게 없는 상태   
    커밋을 하고 난 직후에는 working directory 안의 모든 파일들이 이 상태가 됨

    3. Modified 상태   
    최신 커밋의 모습과 비교했을 때 조금이라도 바뀐 내용이 있는 상태

## 명령어
- git init : .git 디렉토리 생성
- git config user.name '이름' : 현재 사용자의 이름 설정(닉네임 혹은 아이디)
- git config user.email '이메일' : 현재 사용자의 이메일 설정
- git add '파일 이름' : 수정사항이 있는 파일들을 staging area에 올림
- git reset '파일 이름' : staging area에 올렸던 파일을 삭제
- git status : 현재 프로젝트 내의 파일 상태 확인
- git commit -m '커밋 메시지' : staging area에 있는 파일들 커밋 남기기
- git push -u origin master : remote repository에 처음 올릴 때 사용
- git push : local repository에서 remote repository로 올리기
- git pull : remote repository의 내용을 local repository로 가져오기
- git clone '주소' : '주소'에 프로젝트를 가져오기
- git log : commit history를 보여줌
- git log --pretty : commit history를 다양한 방식으로 보여줄 수 있음
- git log --pretty-oneline : commit을 한 줄씩 보여줌
- git show '커밋 아이디' : 특정 commit에서 어떤 병경사항이 있었는지 확인
- git commit --amend : 최신 commit을 다시 수정해서 새로운 커밋으로 만듬
- git config alias.별명 커맨드 : 명령어에 별명을 붙여서 이후로 별명으로 해당 명령어를 실행할 수 있도록 설정
- git diff '커밋 아이디' '커밋 아이디' : 두 commit 간의 차이 비교
- git reset --soft 커밋아이디 : HEAD가 특정 commit을 가리키도록 이동시킴
- git reset --mixed 커밋아이디 : --soft에서의 기능과 staging area도 특정 commit처럼 변경
- git reset --hard 커밋아이디 : --mixed에서의 기능과 working directory도 특정 commit처럼 변경
- git tag '태그명' ''커밋 아이디'' : 특정 commit에 태그를 붙임
- git tag : 태그 목록을 보여줌
- git tag -d '태그명' : 태그 삭제
- git branch '브랜치 이름' : 새로운 branch 생성
- git checkout '브랜치 이름' : 그 branch로 이동(기존 branch)
- git checkout -b '브랜치 이름' : 새로운 branch를 생성 후 그 branch로 이동
- git branch -d '브랜치 이름' : branch 삭제
- git merge '브랜치 이름' : 현재 branch에 다른 branch를 병합(merge)
- git merge --aboort : merge를 하다가 conflict(충돌)가 발생했을 때, 일단은 merge작업을 취소하고 이전 상태로 돌아감, merge 작업 취소
- git fetch : remote repository에 코드를 local repository에 가져오기,     
  머지하기 전에 점검해야할 필요가 있을 때 사용(git diff로 비교), git pull은 git fetch 후 자동으로 merge도 해주는 기능
- git blame '파일 이름' : 어떤 파일의 특정 코드를 누가 작성했는지 찾아내기 위한 명령어
- git revert '커밋 아이디' : 특정 commit에서 이루어진 작업을 되돌리는 commit을 새로 생성(전에 했던 commit을 다시 commit)
- git reflog : HEAD가 이때까지 가리켜왔던 commit들을 기록한 정보를 보여주기

- merge 중 conflict가 발생했을 경우   
conflict가 발생한 파일을 열고   
merge의 결과가 되었으면 하는 모습대로 코드를 수정 후 commit
- 그 외 
    - HEAD : 어떤 커밋 하나를 가리킴
    - branch : 하나의 코드 관리 흐름
    - master : 처음 repository를 만들고 커밋을 하면 자동으로 생기는 브랜치(기본 브랜치) 
    - git의 HEAD는 branch를 가르키고 그 branch는 커밋을 가르키는 방식   
    ex) HEAD -> master -> abcd12...(commit)  

<br>
<br>

[출처 : codeit Git으로 배우는 버전 관리](https://www.codeit.kr/courses/version-control-with-git)