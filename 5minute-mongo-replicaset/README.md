# 5분 몽고DB 레플리카 셋 구성

코마의 도커 Awesome 입니다. 5분 안에 몽고 DB 레플리카 셋을 구성하도록 돕고있습니다. 아래의 명령어를 타이핑 해주세요.

## 설치 (Set up)

1. 레플리카셋 설정하기

```bash
$ docker-compose -f docker-compose-init.yml up
# 설정이 완료되면 Ctrl+C 를 눌러서 빠져나오세요.
```

2. 인증 추가하기

```bash
$ docker-compose -f docker-compose-addauth.yml up
# 설정이 완료되면 Ctrl+C 를 눌러서 빠져나오세요.
```


```bash
 $ docker-compose up -d && docker-compose logs -f
```