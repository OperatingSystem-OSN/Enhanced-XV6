
user/_strace:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[])
{
   0:	712d                	addi	sp,sp,-288
   2:	ee06                	sd	ra,280(sp)
   4:	ea22                	sd	s0,272(sp)
   6:	e626                	sd	s1,264(sp)
   8:	e24a                	sd	s2,256(sp)
   a:	1200                	addi	s0,sp,288
   c:	892a                	mv	s2,a0
   e:	84ae                	mv	s1,a1
    char *argList[MAXARG];
    int b = atoi(argv[1]);
  10:	6588                	ld	a0,8(a1)
  12:	00000097          	auipc	ra,0x0
  16:	250080e7          	jalr	592(ra) # 262 <atoi>
    int i;
    if (argc < 3)
  1a:	4789                	li	a5,2
  1c:	0327db63          	bge	a5,s2,52 <main+0x52>
    {
        fprintf(2, "Usage: %s mask command\n", argv[0]);
        exit(1);
    }
    else if (argv[1][0] < '0' || argv[1][0] > '9')
  20:	649c                	ld	a5,8(s1)
  22:	0007c783          	lbu	a5,0(a5)
  26:	fd07879b          	addiw	a5,a5,-48
  2a:	0ff7f793          	zext.b	a5,a5
  2e:	4725                	li	a4,9
  30:	04f77063          	bgeu	a4,a5,70 <main+0x70>
    {
        fprintf(2, "Usage: %s mask command\n", argv[0]);
  34:	6090                	ld	a2,0(s1)
  36:	00001597          	auipc	a1,0x1
  3a:	87a58593          	addi	a1,a1,-1926 # 8b0 <malloc+0xea>
  3e:	4509                	li	a0,2
  40:	00000097          	auipc	ra,0x0
  44:	6a0080e7          	jalr	1696(ra) # 6e0 <fprintf>
        exit(1);
  48:	4505                	li	a0,1
  4a:	00000097          	auipc	ra,0x0
  4e:	312080e7          	jalr	786(ra) # 35c <exit>
        fprintf(2, "Usage: %s mask command\n", argv[0]);
  52:	6090                	ld	a2,0(s1)
  54:	00001597          	auipc	a1,0x1
  58:	85c58593          	addi	a1,a1,-1956 # 8b0 <malloc+0xea>
  5c:	4509                	li	a0,2
  5e:	00000097          	auipc	ra,0x0
  62:	682080e7          	jalr	1666(ra) # 6e0 <fprintf>
        exit(1);
  66:	4505                	li	a0,1
  68:	00000097          	auipc	ra,0x0
  6c:	2f4080e7          	jalr	756(ra) # 35c <exit>
    }
    // error handling
    if (trace(b) < 0)
  70:	00000097          	auipc	ra,0x0
  74:	3a4080e7          	jalr	932(ra) # 414 <trace>
  78:	00054963          	bltz	a0,8a <main+0x8a>
  7c:	01048593          	addi	a1,s1,16
  80:	ee040713          	addi	a4,s0,-288
    {
        fprintf(2, "%s: trace failed\n", argv[0]);
        exit(1);
    }
    for (i = 2; i < argc; i++)
  84:	4789                	li	a5,2
    {
        if(i < MAXARG)
  86:	46fd                	li	a3,31
  88:	a02d                	j	b2 <main+0xb2>
        fprintf(2, "%s: trace failed\n", argv[0]);
  8a:	6090                	ld	a2,0(s1)
  8c:	00001597          	auipc	a1,0x1
  90:	83c58593          	addi	a1,a1,-1988 # 8c8 <malloc+0x102>
  94:	4509                	li	a0,2
  96:	00000097          	auipc	ra,0x0
  9a:	64a080e7          	jalr	1610(ra) # 6e0 <fprintf>
        exit(1);
  9e:	4505                	li	a0,1
  a0:	00000097          	auipc	ra,0x0
  a4:	2bc080e7          	jalr	700(ra) # 35c <exit>
    for (i = 2; i < argc; i++)
  a8:	2785                	addiw	a5,a5,1
  aa:	05a1                	addi	a1,a1,8
  ac:	0721                	addi	a4,a4,8
  ae:	00f90763          	beq	s2,a5,bc <main+0xbc>
        if(i < MAXARG)
  b2:	fef6cbe3          	blt	a3,a5,a8 <main+0xa8>
            argList[i - 2] = argv[i];
  b6:	6190                	ld	a2,0(a1)
  b8:	e310                	sd	a2,0(a4)
  ba:	b7fd                	j	a8 <main+0xa8>
    }

    exec(argList[0], argList);
  bc:	ee040593          	addi	a1,s0,-288
  c0:	ee043503          	ld	a0,-288(s0)
  c4:	00000097          	auipc	ra,0x0
  c8:	2d0080e7          	jalr	720(ra) # 394 <exec>

    exit(0);
  cc:	4501                	li	a0,0
  ce:	00000097          	auipc	ra,0x0
  d2:	28e080e7          	jalr	654(ra) # 35c <exit>

00000000000000d6 <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
  d6:	1141                	addi	sp,sp,-16
  d8:	e406                	sd	ra,8(sp)
  da:	e022                	sd	s0,0(sp)
  dc:	0800                	addi	s0,sp,16
  extern int main();
  main();
  de:	00000097          	auipc	ra,0x0
  e2:	f22080e7          	jalr	-222(ra) # 0 <main>
  exit(0);
  e6:	4501                	li	a0,0
  e8:	00000097          	auipc	ra,0x0
  ec:	274080e7          	jalr	628(ra) # 35c <exit>

00000000000000f0 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
  f0:	1141                	addi	sp,sp,-16
  f2:	e422                	sd	s0,8(sp)
  f4:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f6:	87aa                	mv	a5,a0
  f8:	0585                	addi	a1,a1,1
  fa:	0785                	addi	a5,a5,1
  fc:	fff5c703          	lbu	a4,-1(a1)
 100:	fee78fa3          	sb	a4,-1(a5)
 104:	fb75                	bnez	a4,f8 <strcpy+0x8>
    ;
  return os;
}
 106:	6422                	ld	s0,8(sp)
 108:	0141                	addi	sp,sp,16
 10a:	8082                	ret

000000000000010c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10c:	1141                	addi	sp,sp,-16
 10e:	e422                	sd	s0,8(sp)
 110:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 112:	00054783          	lbu	a5,0(a0)
 116:	cb91                	beqz	a5,12a <strcmp+0x1e>
 118:	0005c703          	lbu	a4,0(a1)
 11c:	00f71763          	bne	a4,a5,12a <strcmp+0x1e>
    p++, q++;
 120:	0505                	addi	a0,a0,1
 122:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 124:	00054783          	lbu	a5,0(a0)
 128:	fbe5                	bnez	a5,118 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 12a:	0005c503          	lbu	a0,0(a1)
}
 12e:	40a7853b          	subw	a0,a5,a0
 132:	6422                	ld	s0,8(sp)
 134:	0141                	addi	sp,sp,16
 136:	8082                	ret

0000000000000138 <strlen>:

uint
strlen(const char *s)
{
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 13e:	00054783          	lbu	a5,0(a0)
 142:	cf91                	beqz	a5,15e <strlen+0x26>
 144:	0505                	addi	a0,a0,1
 146:	87aa                	mv	a5,a0
 148:	4685                	li	a3,1
 14a:	9e89                	subw	a3,a3,a0
 14c:	00f6853b          	addw	a0,a3,a5
 150:	0785                	addi	a5,a5,1
 152:	fff7c703          	lbu	a4,-1(a5)
 156:	fb7d                	bnez	a4,14c <strlen+0x14>
    ;
  return n;
}
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
  for(n = 0; s[n]; n++)
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strlen+0x20>

0000000000000162 <memset>:

void*
memset(void *dst, int c, uint n)
{
 162:	1141                	addi	sp,sp,-16
 164:	e422                	sd	s0,8(sp)
 166:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 168:	ca19                	beqz	a2,17e <memset+0x1c>
 16a:	87aa                	mv	a5,a0
 16c:	1602                	slli	a2,a2,0x20
 16e:	9201                	srli	a2,a2,0x20
 170:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 174:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 178:	0785                	addi	a5,a5,1
 17a:	fee79de3          	bne	a5,a4,174 <memset+0x12>
  }
  return dst;
}
 17e:	6422                	ld	s0,8(sp)
 180:	0141                	addi	sp,sp,16
 182:	8082                	ret

0000000000000184 <strchr>:

char*
strchr(const char *s, char c)
{
 184:	1141                	addi	sp,sp,-16
 186:	e422                	sd	s0,8(sp)
 188:	0800                	addi	s0,sp,16
  for(; *s; s++)
 18a:	00054783          	lbu	a5,0(a0)
 18e:	cb99                	beqz	a5,1a4 <strchr+0x20>
    if(*s == c)
 190:	00f58763          	beq	a1,a5,19e <strchr+0x1a>
  for(; *s; s++)
 194:	0505                	addi	a0,a0,1
 196:	00054783          	lbu	a5,0(a0)
 19a:	fbfd                	bnez	a5,190 <strchr+0xc>
      return (char*)s;
  return 0;
 19c:	4501                	li	a0,0
}
 19e:	6422                	ld	s0,8(sp)
 1a0:	0141                	addi	sp,sp,16
 1a2:	8082                	ret
  return 0;
 1a4:	4501                	li	a0,0
 1a6:	bfe5                	j	19e <strchr+0x1a>

00000000000001a8 <gets>:

char*
gets(char *buf, int max)
{
 1a8:	711d                	addi	sp,sp,-96
 1aa:	ec86                	sd	ra,88(sp)
 1ac:	e8a2                	sd	s0,80(sp)
 1ae:	e4a6                	sd	s1,72(sp)
 1b0:	e0ca                	sd	s2,64(sp)
 1b2:	fc4e                	sd	s3,56(sp)
 1b4:	f852                	sd	s4,48(sp)
 1b6:	f456                	sd	s5,40(sp)
 1b8:	f05a                	sd	s6,32(sp)
 1ba:	ec5e                	sd	s7,24(sp)
 1bc:	1080                	addi	s0,sp,96
 1be:	8baa                	mv	s7,a0
 1c0:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c2:	892a                	mv	s2,a0
 1c4:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1c6:	4aa9                	li	s5,10
 1c8:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 1ca:	89a6                	mv	s3,s1
 1cc:	2485                	addiw	s1,s1,1
 1ce:	0344d863          	bge	s1,s4,1fe <gets+0x56>
    cc = read(0, &c, 1);
 1d2:	4605                	li	a2,1
 1d4:	faf40593          	addi	a1,s0,-81
 1d8:	4501                	li	a0,0
 1da:	00000097          	auipc	ra,0x0
 1de:	19a080e7          	jalr	410(ra) # 374 <read>
    if(cc < 1)
 1e2:	00a05e63          	blez	a0,1fe <gets+0x56>
    buf[i++] = c;
 1e6:	faf44783          	lbu	a5,-81(s0)
 1ea:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1ee:	01578763          	beq	a5,s5,1fc <gets+0x54>
 1f2:	0905                	addi	s2,s2,1
 1f4:	fd679be3          	bne	a5,s6,1ca <gets+0x22>
  for(i=0; i+1 < max; ){
 1f8:	89a6                	mv	s3,s1
 1fa:	a011                	j	1fe <gets+0x56>
 1fc:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1fe:	99de                	add	s3,s3,s7
 200:	00098023          	sb	zero,0(s3)
  return buf;
}
 204:	855e                	mv	a0,s7
 206:	60e6                	ld	ra,88(sp)
 208:	6446                	ld	s0,80(sp)
 20a:	64a6                	ld	s1,72(sp)
 20c:	6906                	ld	s2,64(sp)
 20e:	79e2                	ld	s3,56(sp)
 210:	7a42                	ld	s4,48(sp)
 212:	7aa2                	ld	s5,40(sp)
 214:	7b02                	ld	s6,32(sp)
 216:	6be2                	ld	s7,24(sp)
 218:	6125                	addi	sp,sp,96
 21a:	8082                	ret

000000000000021c <stat>:

int
stat(const char *n, struct stat *st)
{
 21c:	1101                	addi	sp,sp,-32
 21e:	ec06                	sd	ra,24(sp)
 220:	e822                	sd	s0,16(sp)
 222:	e426                	sd	s1,8(sp)
 224:	e04a                	sd	s2,0(sp)
 226:	1000                	addi	s0,sp,32
 228:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 22a:	4581                	li	a1,0
 22c:	00000097          	auipc	ra,0x0
 230:	170080e7          	jalr	368(ra) # 39c <open>
  if(fd < 0)
 234:	02054563          	bltz	a0,25e <stat+0x42>
 238:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 23a:	85ca                	mv	a1,s2
 23c:	00000097          	auipc	ra,0x0
 240:	178080e7          	jalr	376(ra) # 3b4 <fstat>
 244:	892a                	mv	s2,a0
  close(fd);
 246:	8526                	mv	a0,s1
 248:	00000097          	auipc	ra,0x0
 24c:	13c080e7          	jalr	316(ra) # 384 <close>
  return r;
}
 250:	854a                	mv	a0,s2
 252:	60e2                	ld	ra,24(sp)
 254:	6442                	ld	s0,16(sp)
 256:	64a2                	ld	s1,8(sp)
 258:	6902                	ld	s2,0(sp)
 25a:	6105                	addi	sp,sp,32
 25c:	8082                	ret
    return -1;
 25e:	597d                	li	s2,-1
 260:	bfc5                	j	250 <stat+0x34>

0000000000000262 <atoi>:

int
atoi(const char *s)
{
 262:	1141                	addi	sp,sp,-16
 264:	e422                	sd	s0,8(sp)
 266:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 268:	00054683          	lbu	a3,0(a0)
 26c:	fd06879b          	addiw	a5,a3,-48
 270:	0ff7f793          	zext.b	a5,a5
 274:	4625                	li	a2,9
 276:	02f66863          	bltu	a2,a5,2a6 <atoi+0x44>
 27a:	872a                	mv	a4,a0
  n = 0;
 27c:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 27e:	0705                	addi	a4,a4,1
 280:	0025179b          	slliw	a5,a0,0x2
 284:	9fa9                	addw	a5,a5,a0
 286:	0017979b          	slliw	a5,a5,0x1
 28a:	9fb5                	addw	a5,a5,a3
 28c:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 290:	00074683          	lbu	a3,0(a4)
 294:	fd06879b          	addiw	a5,a3,-48
 298:	0ff7f793          	zext.b	a5,a5
 29c:	fef671e3          	bgeu	a2,a5,27e <atoi+0x1c>
  return n;
}
 2a0:	6422                	ld	s0,8(sp)
 2a2:	0141                	addi	sp,sp,16
 2a4:	8082                	ret
  n = 0;
 2a6:	4501                	li	a0,0
 2a8:	bfe5                	j	2a0 <atoi+0x3e>

00000000000002aa <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2aa:	1141                	addi	sp,sp,-16
 2ac:	e422                	sd	s0,8(sp)
 2ae:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2b0:	02b57463          	bgeu	a0,a1,2d8 <memmove+0x2e>
    while(n-- > 0)
 2b4:	00c05f63          	blez	a2,2d2 <memmove+0x28>
 2b8:	1602                	slli	a2,a2,0x20
 2ba:	9201                	srli	a2,a2,0x20
 2bc:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 2c0:	872a                	mv	a4,a0
      *dst++ = *src++;
 2c2:	0585                	addi	a1,a1,1
 2c4:	0705                	addi	a4,a4,1
 2c6:	fff5c683          	lbu	a3,-1(a1)
 2ca:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2ce:	fee79ae3          	bne	a5,a4,2c2 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2d2:	6422                	ld	s0,8(sp)
 2d4:	0141                	addi	sp,sp,16
 2d6:	8082                	ret
    dst += n;
 2d8:	00c50733          	add	a4,a0,a2
    src += n;
 2dc:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2de:	fec05ae3          	blez	a2,2d2 <memmove+0x28>
 2e2:	fff6079b          	addiw	a5,a2,-1
 2e6:	1782                	slli	a5,a5,0x20
 2e8:	9381                	srli	a5,a5,0x20
 2ea:	fff7c793          	not	a5,a5
 2ee:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2f0:	15fd                	addi	a1,a1,-1
 2f2:	177d                	addi	a4,a4,-1
 2f4:	0005c683          	lbu	a3,0(a1)
 2f8:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2fc:	fee79ae3          	bne	a5,a4,2f0 <memmove+0x46>
 300:	bfc9                	j	2d2 <memmove+0x28>

0000000000000302 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 302:	1141                	addi	sp,sp,-16
 304:	e422                	sd	s0,8(sp)
 306:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 308:	ca05                	beqz	a2,338 <memcmp+0x36>
 30a:	fff6069b          	addiw	a3,a2,-1
 30e:	1682                	slli	a3,a3,0x20
 310:	9281                	srli	a3,a3,0x20
 312:	0685                	addi	a3,a3,1
 314:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 316:	00054783          	lbu	a5,0(a0)
 31a:	0005c703          	lbu	a4,0(a1)
 31e:	00e79863          	bne	a5,a4,32e <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 322:	0505                	addi	a0,a0,1
    p2++;
 324:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 326:	fed518e3          	bne	a0,a3,316 <memcmp+0x14>
  }
  return 0;
 32a:	4501                	li	a0,0
 32c:	a019                	j	332 <memcmp+0x30>
      return *p1 - *p2;
 32e:	40e7853b          	subw	a0,a5,a4
}
 332:	6422                	ld	s0,8(sp)
 334:	0141                	addi	sp,sp,16
 336:	8082                	ret
  return 0;
 338:	4501                	li	a0,0
 33a:	bfe5                	j	332 <memcmp+0x30>

000000000000033c <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 33c:	1141                	addi	sp,sp,-16
 33e:	e406                	sd	ra,8(sp)
 340:	e022                	sd	s0,0(sp)
 342:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 344:	00000097          	auipc	ra,0x0
 348:	f66080e7          	jalr	-154(ra) # 2aa <memmove>
}
 34c:	60a2                	ld	ra,8(sp)
 34e:	6402                	ld	s0,0(sp)
 350:	0141                	addi	sp,sp,16
 352:	8082                	ret

0000000000000354 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 354:	4885                	li	a7,1
 ecall
 356:	00000073          	ecall
 ret
 35a:	8082                	ret

000000000000035c <exit>:
.global exit
exit:
 li a7, SYS_exit
 35c:	4889                	li	a7,2
 ecall
 35e:	00000073          	ecall
 ret
 362:	8082                	ret

0000000000000364 <wait>:
.global wait
wait:
 li a7, SYS_wait
 364:	488d                	li	a7,3
 ecall
 366:	00000073          	ecall
 ret
 36a:	8082                	ret

000000000000036c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 36c:	4891                	li	a7,4
 ecall
 36e:	00000073          	ecall
 ret
 372:	8082                	ret

0000000000000374 <read>:
.global read
read:
 li a7, SYS_read
 374:	4895                	li	a7,5
 ecall
 376:	00000073          	ecall
 ret
 37a:	8082                	ret

000000000000037c <write>:
.global write
write:
 li a7, SYS_write
 37c:	48c1                	li	a7,16
 ecall
 37e:	00000073          	ecall
 ret
 382:	8082                	ret

0000000000000384 <close>:
.global close
close:
 li a7, SYS_close
 384:	48d5                	li	a7,21
 ecall
 386:	00000073          	ecall
 ret
 38a:	8082                	ret

000000000000038c <kill>:
.global kill
kill:
 li a7, SYS_kill
 38c:	4899                	li	a7,6
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <exec>:
.global exec
exec:
 li a7, SYS_exec
 394:	489d                	li	a7,7
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <open>:
.global open
open:
 li a7, SYS_open
 39c:	48bd                	li	a7,15
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 3a4:	48c5                	li	a7,17
 ecall
 3a6:	00000073          	ecall
 ret
 3aa:	8082                	ret

00000000000003ac <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 3ac:	48c9                	li	a7,18
 ecall
 3ae:	00000073          	ecall
 ret
 3b2:	8082                	ret

00000000000003b4 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3b4:	48a1                	li	a7,8
 ecall
 3b6:	00000073          	ecall
 ret
 3ba:	8082                	ret

00000000000003bc <link>:
.global link
link:
 li a7, SYS_link
 3bc:	48cd                	li	a7,19
 ecall
 3be:	00000073          	ecall
 ret
 3c2:	8082                	ret

00000000000003c4 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3c4:	48d1                	li	a7,20
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3cc:	48a5                	li	a7,9
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <dup>:
.global dup
dup:
 li a7, SYS_dup
 3d4:	48a9                	li	a7,10
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3dc:	48ad                	li	a7,11
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3e4:	48b1                	li	a7,12
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3ec:	48b5                	li	a7,13
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3f4:	48b9                	li	a7,14
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <hello>:
.global hello
hello:
 li a7, SYS_hello
 3fc:	48e1                	li	a7,24
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <sigreturn>:
.global sigreturn
sigreturn:
 li a7, SYS_sigreturn
 404:	48dd                	li	a7,23
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <sigalarm>:
.global sigalarm
sigalarm:
 li a7, SYS_sigalarm
 40c:	48d9                	li	a7,22
 ecall
 40e:	00000073          	ecall
 ret
 412:	8082                	ret

0000000000000414 <trace>:
.global trace
trace:
 li a7, SYS_trace
 414:	48e5                	li	a7,25
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <waitx>:
.global waitx
waitx:
 li a7, SYS_waitx
 41c:	48e9                	li	a7,26
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <set_priority>:
.global set_priority
set_priority:
 li a7, SYS_set_priority
 424:	48ed                	li	a7,27
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <settickets>:
.global settickets
settickets:
 li a7, SYS_settickets
 42c:	48f1                	li	a7,28
 ecall
 42e:	00000073          	ecall
 ret
 432:	8082                	ret

0000000000000434 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 434:	1101                	addi	sp,sp,-32
 436:	ec06                	sd	ra,24(sp)
 438:	e822                	sd	s0,16(sp)
 43a:	1000                	addi	s0,sp,32
 43c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 440:	4605                	li	a2,1
 442:	fef40593          	addi	a1,s0,-17
 446:	00000097          	auipc	ra,0x0
 44a:	f36080e7          	jalr	-202(ra) # 37c <write>
}
 44e:	60e2                	ld	ra,24(sp)
 450:	6442                	ld	s0,16(sp)
 452:	6105                	addi	sp,sp,32
 454:	8082                	ret

0000000000000456 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 456:	7139                	addi	sp,sp,-64
 458:	fc06                	sd	ra,56(sp)
 45a:	f822                	sd	s0,48(sp)
 45c:	f426                	sd	s1,40(sp)
 45e:	f04a                	sd	s2,32(sp)
 460:	ec4e                	sd	s3,24(sp)
 462:	0080                	addi	s0,sp,64
 464:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 466:	c299                	beqz	a3,46c <printint+0x16>
 468:	0805c963          	bltz	a1,4fa <printint+0xa4>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 46c:	2581                	sext.w	a1,a1
  neg = 0;
 46e:	4881                	li	a7,0
 470:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 474:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 476:	2601                	sext.w	a2,a2
 478:	00000517          	auipc	a0,0x0
 47c:	4c850513          	addi	a0,a0,1224 # 940 <digits>
 480:	883a                	mv	a6,a4
 482:	2705                	addiw	a4,a4,1
 484:	02c5f7bb          	remuw	a5,a1,a2
 488:	1782                	slli	a5,a5,0x20
 48a:	9381                	srli	a5,a5,0x20
 48c:	97aa                	add	a5,a5,a0
 48e:	0007c783          	lbu	a5,0(a5)
 492:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 496:	0005879b          	sext.w	a5,a1
 49a:	02c5d5bb          	divuw	a1,a1,a2
 49e:	0685                	addi	a3,a3,1
 4a0:	fec7f0e3          	bgeu	a5,a2,480 <printint+0x2a>
  if(neg)
 4a4:	00088c63          	beqz	a7,4bc <printint+0x66>
    buf[i++] = '-';
 4a8:	fd070793          	addi	a5,a4,-48
 4ac:	00878733          	add	a4,a5,s0
 4b0:	02d00793          	li	a5,45
 4b4:	fef70823          	sb	a5,-16(a4)
 4b8:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4bc:	02e05863          	blez	a4,4ec <printint+0x96>
 4c0:	fc040793          	addi	a5,s0,-64
 4c4:	00e78933          	add	s2,a5,a4
 4c8:	fff78993          	addi	s3,a5,-1
 4cc:	99ba                	add	s3,s3,a4
 4ce:	377d                	addiw	a4,a4,-1
 4d0:	1702                	slli	a4,a4,0x20
 4d2:	9301                	srli	a4,a4,0x20
 4d4:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4d8:	fff94583          	lbu	a1,-1(s2)
 4dc:	8526                	mv	a0,s1
 4de:	00000097          	auipc	ra,0x0
 4e2:	f56080e7          	jalr	-170(ra) # 434 <putc>
  while(--i >= 0)
 4e6:	197d                	addi	s2,s2,-1
 4e8:	ff3918e3          	bne	s2,s3,4d8 <printint+0x82>
}
 4ec:	70e2                	ld	ra,56(sp)
 4ee:	7442                	ld	s0,48(sp)
 4f0:	74a2                	ld	s1,40(sp)
 4f2:	7902                	ld	s2,32(sp)
 4f4:	69e2                	ld	s3,24(sp)
 4f6:	6121                	addi	sp,sp,64
 4f8:	8082                	ret
    x = -xx;
 4fa:	40b005bb          	negw	a1,a1
    neg = 1;
 4fe:	4885                	li	a7,1
    x = -xx;
 500:	bf85                	j	470 <printint+0x1a>

0000000000000502 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 502:	7119                	addi	sp,sp,-128
 504:	fc86                	sd	ra,120(sp)
 506:	f8a2                	sd	s0,112(sp)
 508:	f4a6                	sd	s1,104(sp)
 50a:	f0ca                	sd	s2,96(sp)
 50c:	ecce                	sd	s3,88(sp)
 50e:	e8d2                	sd	s4,80(sp)
 510:	e4d6                	sd	s5,72(sp)
 512:	e0da                	sd	s6,64(sp)
 514:	fc5e                	sd	s7,56(sp)
 516:	f862                	sd	s8,48(sp)
 518:	f466                	sd	s9,40(sp)
 51a:	f06a                	sd	s10,32(sp)
 51c:	ec6e                	sd	s11,24(sp)
 51e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 520:	0005c903          	lbu	s2,0(a1)
 524:	18090f63          	beqz	s2,6c2 <vprintf+0x1c0>
 528:	8aaa                	mv	s5,a0
 52a:	8b32                	mv	s6,a2
 52c:	00158493          	addi	s1,a1,1
  state = 0;
 530:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 532:	02500a13          	li	s4,37
 536:	4c55                	li	s8,21
 538:	00000c97          	auipc	s9,0x0
 53c:	3b0c8c93          	addi	s9,s9,944 # 8e8 <malloc+0x122>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 540:	02800d93          	li	s11,40
  putc(fd, 'x');
 544:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 546:	00000b97          	auipc	s7,0x0
 54a:	3fab8b93          	addi	s7,s7,1018 # 940 <digits>
 54e:	a839                	j	56c <vprintf+0x6a>
        putc(fd, c);
 550:	85ca                	mv	a1,s2
 552:	8556                	mv	a0,s5
 554:	00000097          	auipc	ra,0x0
 558:	ee0080e7          	jalr	-288(ra) # 434 <putc>
 55c:	a019                	j	562 <vprintf+0x60>
    } else if(state == '%'){
 55e:	01498d63          	beq	s3,s4,578 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 562:	0485                	addi	s1,s1,1
 564:	fff4c903          	lbu	s2,-1(s1)
 568:	14090d63          	beqz	s2,6c2 <vprintf+0x1c0>
    if(state == 0){
 56c:	fe0999e3          	bnez	s3,55e <vprintf+0x5c>
      if(c == '%'){
 570:	ff4910e3          	bne	s2,s4,550 <vprintf+0x4e>
        state = '%';
 574:	89d2                	mv	s3,s4
 576:	b7f5                	j	562 <vprintf+0x60>
      if(c == 'd'){
 578:	11490c63          	beq	s2,s4,690 <vprintf+0x18e>
 57c:	f9d9079b          	addiw	a5,s2,-99
 580:	0ff7f793          	zext.b	a5,a5
 584:	10fc6e63          	bltu	s8,a5,6a0 <vprintf+0x19e>
 588:	f9d9079b          	addiw	a5,s2,-99
 58c:	0ff7f713          	zext.b	a4,a5
 590:	10ec6863          	bltu	s8,a4,6a0 <vprintf+0x19e>
 594:	00271793          	slli	a5,a4,0x2
 598:	97e6                	add	a5,a5,s9
 59a:	439c                	lw	a5,0(a5)
 59c:	97e6                	add	a5,a5,s9
 59e:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 5a0:	008b0913          	addi	s2,s6,8
 5a4:	4685                	li	a3,1
 5a6:	4629                	li	a2,10
 5a8:	000b2583          	lw	a1,0(s6)
 5ac:	8556                	mv	a0,s5
 5ae:	00000097          	auipc	ra,0x0
 5b2:	ea8080e7          	jalr	-344(ra) # 456 <printint>
 5b6:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5b8:	4981                	li	s3,0
 5ba:	b765                	j	562 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5bc:	008b0913          	addi	s2,s6,8
 5c0:	4681                	li	a3,0
 5c2:	4629                	li	a2,10
 5c4:	000b2583          	lw	a1,0(s6)
 5c8:	8556                	mv	a0,s5
 5ca:	00000097          	auipc	ra,0x0
 5ce:	e8c080e7          	jalr	-372(ra) # 456 <printint>
 5d2:	8b4a                	mv	s6,s2
      state = 0;
 5d4:	4981                	li	s3,0
 5d6:	b771                	j	562 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5d8:	008b0913          	addi	s2,s6,8
 5dc:	4681                	li	a3,0
 5de:	866a                	mv	a2,s10
 5e0:	000b2583          	lw	a1,0(s6)
 5e4:	8556                	mv	a0,s5
 5e6:	00000097          	auipc	ra,0x0
 5ea:	e70080e7          	jalr	-400(ra) # 456 <printint>
 5ee:	8b4a                	mv	s6,s2
      state = 0;
 5f0:	4981                	li	s3,0
 5f2:	bf85                	j	562 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5f4:	008b0793          	addi	a5,s6,8
 5f8:	f8f43423          	sd	a5,-120(s0)
 5fc:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 600:	03000593          	li	a1,48
 604:	8556                	mv	a0,s5
 606:	00000097          	auipc	ra,0x0
 60a:	e2e080e7          	jalr	-466(ra) # 434 <putc>
  putc(fd, 'x');
 60e:	07800593          	li	a1,120
 612:	8556                	mv	a0,s5
 614:	00000097          	auipc	ra,0x0
 618:	e20080e7          	jalr	-480(ra) # 434 <putc>
 61c:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 61e:	03c9d793          	srli	a5,s3,0x3c
 622:	97de                	add	a5,a5,s7
 624:	0007c583          	lbu	a1,0(a5)
 628:	8556                	mv	a0,s5
 62a:	00000097          	auipc	ra,0x0
 62e:	e0a080e7          	jalr	-502(ra) # 434 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 632:	0992                	slli	s3,s3,0x4
 634:	397d                	addiw	s2,s2,-1
 636:	fe0914e3          	bnez	s2,61e <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 63a:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 63e:	4981                	li	s3,0
 640:	b70d                	j	562 <vprintf+0x60>
        s = va_arg(ap, char*);
 642:	008b0913          	addi	s2,s6,8
 646:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 64a:	02098163          	beqz	s3,66c <vprintf+0x16a>
        while(*s != 0){
 64e:	0009c583          	lbu	a1,0(s3)
 652:	c5ad                	beqz	a1,6bc <vprintf+0x1ba>
          putc(fd, *s);
 654:	8556                	mv	a0,s5
 656:	00000097          	auipc	ra,0x0
 65a:	dde080e7          	jalr	-546(ra) # 434 <putc>
          s++;
 65e:	0985                	addi	s3,s3,1
        while(*s != 0){
 660:	0009c583          	lbu	a1,0(s3)
 664:	f9e5                	bnez	a1,654 <vprintf+0x152>
        s = va_arg(ap, char*);
 666:	8b4a                	mv	s6,s2
      state = 0;
 668:	4981                	li	s3,0
 66a:	bde5                	j	562 <vprintf+0x60>
          s = "(null)";
 66c:	00000997          	auipc	s3,0x0
 670:	27498993          	addi	s3,s3,628 # 8e0 <malloc+0x11a>
        while(*s != 0){
 674:	85ee                	mv	a1,s11
 676:	bff9                	j	654 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 678:	008b0913          	addi	s2,s6,8
 67c:	000b4583          	lbu	a1,0(s6)
 680:	8556                	mv	a0,s5
 682:	00000097          	auipc	ra,0x0
 686:	db2080e7          	jalr	-590(ra) # 434 <putc>
 68a:	8b4a                	mv	s6,s2
      state = 0;
 68c:	4981                	li	s3,0
 68e:	bdd1                	j	562 <vprintf+0x60>
        putc(fd, c);
 690:	85d2                	mv	a1,s4
 692:	8556                	mv	a0,s5
 694:	00000097          	auipc	ra,0x0
 698:	da0080e7          	jalr	-608(ra) # 434 <putc>
      state = 0;
 69c:	4981                	li	s3,0
 69e:	b5d1                	j	562 <vprintf+0x60>
        putc(fd, '%');
 6a0:	85d2                	mv	a1,s4
 6a2:	8556                	mv	a0,s5
 6a4:	00000097          	auipc	ra,0x0
 6a8:	d90080e7          	jalr	-624(ra) # 434 <putc>
        putc(fd, c);
 6ac:	85ca                	mv	a1,s2
 6ae:	8556                	mv	a0,s5
 6b0:	00000097          	auipc	ra,0x0
 6b4:	d84080e7          	jalr	-636(ra) # 434 <putc>
      state = 0;
 6b8:	4981                	li	s3,0
 6ba:	b565                	j	562 <vprintf+0x60>
        s = va_arg(ap, char*);
 6bc:	8b4a                	mv	s6,s2
      state = 0;
 6be:	4981                	li	s3,0
 6c0:	b54d                	j	562 <vprintf+0x60>
    }
  }
}
 6c2:	70e6                	ld	ra,120(sp)
 6c4:	7446                	ld	s0,112(sp)
 6c6:	74a6                	ld	s1,104(sp)
 6c8:	7906                	ld	s2,96(sp)
 6ca:	69e6                	ld	s3,88(sp)
 6cc:	6a46                	ld	s4,80(sp)
 6ce:	6aa6                	ld	s5,72(sp)
 6d0:	6b06                	ld	s6,64(sp)
 6d2:	7be2                	ld	s7,56(sp)
 6d4:	7c42                	ld	s8,48(sp)
 6d6:	7ca2                	ld	s9,40(sp)
 6d8:	7d02                	ld	s10,32(sp)
 6da:	6de2                	ld	s11,24(sp)
 6dc:	6109                	addi	sp,sp,128
 6de:	8082                	ret

00000000000006e0 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6e0:	715d                	addi	sp,sp,-80
 6e2:	ec06                	sd	ra,24(sp)
 6e4:	e822                	sd	s0,16(sp)
 6e6:	1000                	addi	s0,sp,32
 6e8:	e010                	sd	a2,0(s0)
 6ea:	e414                	sd	a3,8(s0)
 6ec:	e818                	sd	a4,16(s0)
 6ee:	ec1c                	sd	a5,24(s0)
 6f0:	03043023          	sd	a6,32(s0)
 6f4:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6f8:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6fc:	8622                	mv	a2,s0
 6fe:	00000097          	auipc	ra,0x0
 702:	e04080e7          	jalr	-508(ra) # 502 <vprintf>
}
 706:	60e2                	ld	ra,24(sp)
 708:	6442                	ld	s0,16(sp)
 70a:	6161                	addi	sp,sp,80
 70c:	8082                	ret

000000000000070e <printf>:

void
printf(const char *fmt, ...)
{
 70e:	711d                	addi	sp,sp,-96
 710:	ec06                	sd	ra,24(sp)
 712:	e822                	sd	s0,16(sp)
 714:	1000                	addi	s0,sp,32
 716:	e40c                	sd	a1,8(s0)
 718:	e810                	sd	a2,16(s0)
 71a:	ec14                	sd	a3,24(s0)
 71c:	f018                	sd	a4,32(s0)
 71e:	f41c                	sd	a5,40(s0)
 720:	03043823          	sd	a6,48(s0)
 724:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 728:	00840613          	addi	a2,s0,8
 72c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 730:	85aa                	mv	a1,a0
 732:	4505                	li	a0,1
 734:	00000097          	auipc	ra,0x0
 738:	dce080e7          	jalr	-562(ra) # 502 <vprintf>
}
 73c:	60e2                	ld	ra,24(sp)
 73e:	6442                	ld	s0,16(sp)
 740:	6125                	addi	sp,sp,96
 742:	8082                	ret

0000000000000744 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 744:	1141                	addi	sp,sp,-16
 746:	e422                	sd	s0,8(sp)
 748:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 74a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74e:	00001797          	auipc	a5,0x1
 752:	8b27b783          	ld	a5,-1870(a5) # 1000 <freep>
 756:	a02d                	j	780 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 758:	4618                	lw	a4,8(a2)
 75a:	9f2d                	addw	a4,a4,a1
 75c:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 760:	6398                	ld	a4,0(a5)
 762:	6310                	ld	a2,0(a4)
 764:	a83d                	j	7a2 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 766:	ff852703          	lw	a4,-8(a0)
 76a:	9f31                	addw	a4,a4,a2
 76c:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 76e:	ff053683          	ld	a3,-16(a0)
 772:	a091                	j	7b6 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	6398                	ld	a4,0(a5)
 776:	00e7e463          	bltu	a5,a4,77e <free+0x3a>
 77a:	00e6ea63          	bltu	a3,a4,78e <free+0x4a>
{
 77e:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 780:	fed7fae3          	bgeu	a5,a3,774 <free+0x30>
 784:	6398                	ld	a4,0(a5)
 786:	00e6e463          	bltu	a3,a4,78e <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78a:	fee7eae3          	bltu	a5,a4,77e <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 78e:	ff852583          	lw	a1,-8(a0)
 792:	6390                	ld	a2,0(a5)
 794:	02059813          	slli	a6,a1,0x20
 798:	01c85713          	srli	a4,a6,0x1c
 79c:	9736                	add	a4,a4,a3
 79e:	fae60de3          	beq	a2,a4,758 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7a6:	4790                	lw	a2,8(a5)
 7a8:	02061593          	slli	a1,a2,0x20
 7ac:	01c5d713          	srli	a4,a1,0x1c
 7b0:	973e                	add	a4,a4,a5
 7b2:	fae68ae3          	beq	a3,a4,766 <free+0x22>
    p->s.ptr = bp->s.ptr;
 7b6:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 7b8:	00001717          	auipc	a4,0x1
 7bc:	84f73423          	sd	a5,-1976(a4) # 1000 <freep>
}
 7c0:	6422                	ld	s0,8(sp)
 7c2:	0141                	addi	sp,sp,16
 7c4:	8082                	ret

00000000000007c6 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c6:	7139                	addi	sp,sp,-64
 7c8:	fc06                	sd	ra,56(sp)
 7ca:	f822                	sd	s0,48(sp)
 7cc:	f426                	sd	s1,40(sp)
 7ce:	f04a                	sd	s2,32(sp)
 7d0:	ec4e                	sd	s3,24(sp)
 7d2:	e852                	sd	s4,16(sp)
 7d4:	e456                	sd	s5,8(sp)
 7d6:	e05a                	sd	s6,0(sp)
 7d8:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7da:	02051493          	slli	s1,a0,0x20
 7de:	9081                	srli	s1,s1,0x20
 7e0:	04bd                	addi	s1,s1,15
 7e2:	8091                	srli	s1,s1,0x4
 7e4:	0014899b          	addiw	s3,s1,1
 7e8:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7ea:	00001517          	auipc	a0,0x1
 7ee:	81653503          	ld	a0,-2026(a0) # 1000 <freep>
 7f2:	c515                	beqz	a0,81e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7f6:	4798                	lw	a4,8(a5)
 7f8:	02977f63          	bgeu	a4,s1,836 <malloc+0x70>
 7fc:	8a4e                	mv	s4,s3
 7fe:	0009871b          	sext.w	a4,s3
 802:	6685                	lui	a3,0x1
 804:	00d77363          	bgeu	a4,a3,80a <malloc+0x44>
 808:	6a05                	lui	s4,0x1
 80a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 80e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 812:	00000917          	auipc	s2,0x0
 816:	7ee90913          	addi	s2,s2,2030 # 1000 <freep>
  if(p == (char*)-1)
 81a:	5afd                	li	s5,-1
 81c:	a895                	j	890 <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 81e:	00000797          	auipc	a5,0x0
 822:	7f278793          	addi	a5,a5,2034 # 1010 <base>
 826:	00000717          	auipc	a4,0x0
 82a:	7cf73d23          	sd	a5,2010(a4) # 1000 <freep>
 82e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 830:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 834:	b7e1                	j	7fc <malloc+0x36>
      if(p->s.size == nunits)
 836:	02e48c63          	beq	s1,a4,86e <malloc+0xa8>
        p->s.size -= nunits;
 83a:	4137073b          	subw	a4,a4,s3
 83e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 840:	02071693          	slli	a3,a4,0x20
 844:	01c6d713          	srli	a4,a3,0x1c
 848:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 84a:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 84e:	00000717          	auipc	a4,0x0
 852:	7aa73923          	sd	a0,1970(a4) # 1000 <freep>
      return (void*)(p + 1);
 856:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 85a:	70e2                	ld	ra,56(sp)
 85c:	7442                	ld	s0,48(sp)
 85e:	74a2                	ld	s1,40(sp)
 860:	7902                	ld	s2,32(sp)
 862:	69e2                	ld	s3,24(sp)
 864:	6a42                	ld	s4,16(sp)
 866:	6aa2                	ld	s5,8(sp)
 868:	6b02                	ld	s6,0(sp)
 86a:	6121                	addi	sp,sp,64
 86c:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 86e:	6398                	ld	a4,0(a5)
 870:	e118                	sd	a4,0(a0)
 872:	bff1                	j	84e <malloc+0x88>
  hp->s.size = nu;
 874:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 878:	0541                	addi	a0,a0,16
 87a:	00000097          	auipc	ra,0x0
 87e:	eca080e7          	jalr	-310(ra) # 744 <free>
  return freep;
 882:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 886:	d971                	beqz	a0,85a <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 888:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 88a:	4798                	lw	a4,8(a5)
 88c:	fa9775e3          	bgeu	a4,s1,836 <malloc+0x70>
    if(p == freep)
 890:	00093703          	ld	a4,0(s2)
 894:	853e                	mv	a0,a5
 896:	fef719e3          	bne	a4,a5,888 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 89a:	8552                	mv	a0,s4
 89c:	00000097          	auipc	ra,0x0
 8a0:	b48080e7          	jalr	-1208(ra) # 3e4 <sbrk>
  if(p == (char*)-1)
 8a4:	fd5518e3          	bne	a0,s5,874 <malloc+0xae>
        return 0;
 8a8:	4501                	li	a0,0
 8aa:	bf45                	j	85a <malloc+0x94>
