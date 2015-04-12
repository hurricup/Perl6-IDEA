package com.perl6.lang.lexer;

/*
    http://jflex.de/manual.html
    http://www2.cs.tum.edu/projects/cup

*/

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IElementType;
import org.jetbrains.annotations.NotNull;

%%

%class Perl6Lexer
%implements FlexLexer, Perl6TokenTypes
%unicode
%public

%function advance
%type IElementType

/*
//%line
//%column
//InputCharacter = [^\r\n]
*/
LINE_TERMINATOR = \r|\n|\r\n
WHITE_SPACE     = {LINE_TERMINATOR} | [ \t\f]
ANY_CHARACTER   = .

END_OF_LINE_COMMENT = "#" {ANY_CHARACTER}* {LINE_TERMINATOR}?

%{
  StringBuffer string = new StringBuffer();
%}

//%state STRING

%%


<YYINITIAL> {END_OF_LINE_COMMENT}                           { yybegin(YYINITIAL); return P6_COMMENT; }

<YYINITIAL> {
   /* comments */
  {END_OF_LINE_COMMENT}                      { /* ignore */ }

  /* whitespace */
  {WHITE_SPACE}                   { /* ignore */ }

/////////////////////////////// RESERVED WORDS /////////////////////////////////////////////////////////////////////////
"-A"			{return P6_BUILT_IN;}
"END"			{return P6_BUILT_IN;}
"length"			{return P6_BUILT_IN;}
"setpgrp"			{return P6_BUILT_IN;}
"-B"			{return P6_BUILT_IN;}
"endgrent"			{return P6_BUILT_IN;}
"link"			{return P6_BUILT_IN;}
"setpriority"			{return P6_BUILT_IN;}
"-b"			{return P6_BUILT_IN;}
"endhostent"			{return P6_BUILT_IN;}
"listen"			{return P6_BUILT_IN;}
"setprotoent"			{return P6_BUILT_IN;}
"-C"			{return P6_BUILT_IN;}
"endnetent"			{return P6_BUILT_IN;}
"local"			{return P6_BUILT_IN;}
"setpwent"			{return P6_BUILT_IN;}
"-c"			{return P6_BUILT_IN;}
"endprotoent"			{return P6_BUILT_IN;}
"localtime"			{return P6_BUILT_IN;}
"setservent"			{return P6_BUILT_IN;}
"-d"			{return P6_BUILT_IN;}
"endpwent"			{return P6_BUILT_IN;}
"log"			{return P6_BUILT_IN;}
"setsockopt"			{return P6_BUILT_IN;}
"-e"			{return P6_BUILT_IN;}
"endservent"			{return P6_BUILT_IN;}
"lstat"			{return P6_BUILT_IN;}
"shift"			{return P6_BUILT_IN;}
"-f"			{return P6_BUILT_IN;}
"eof"			{return P6_BUILT_IN;}
"map"			{return P6_BUILT_IN;}
"shmctl"			{return P6_BUILT_IN;}
"-g"			{return P6_BUILT_IN;}
"eval"			{return P6_BUILT_IN;}
"mkdir"			{return P6_BUILT_IN;}
"shmget"			{return P6_BUILT_IN;}
"-k"			{return P6_BUILT_IN;}
"exec"			{return P6_BUILT_IN;}
"msgctl"			{return P6_BUILT_IN;}
"shmread"			{return P6_BUILT_IN;}
"-l"			{return P6_BUILT_IN;}
"exists"			{return P6_BUILT_IN;}
"msgget"			{return P6_BUILT_IN;}
"shmwrite"			{return P6_BUILT_IN;}
"-M"			{return P6_BUILT_IN;}
"exit"			{return P6_BUILT_IN;}
"msgrcv"			{return P6_BUILT_IN;}
"shutdown"			{return P6_BUILT_IN;}
"-O"			{return P6_BUILT_IN;}
"fcntl"			{return P6_BUILT_IN;}
"msgsnd"			{return P6_BUILT_IN;}
"sin"			{return P6_BUILT_IN;}
"-o"			{return P6_BUILT_IN;}
"fileno"			{return P6_BUILT_IN;}
"my"			{return P6_BUILT_IN;}
"sleep"			{return P6_BUILT_IN;}
"-p"			{return P6_BUILT_IN;}
"flock"			{return P6_BUILT_IN;}
"next"			{return P6_BUILT_IN;}
"socket"			{return P6_BUILT_IN;}
"-r"			{return P6_BUILT_IN;}
"fork"			{return P6_BUILT_IN;}
"not"			{return P6_BUILT_IN;}
"socketpair"			{return P6_BUILT_IN;}
"-R"			{return P6_BUILT_IN;}
"format"			{return P6_BUILT_IN;}
"oct"			{return P6_BUILT_IN;}
"sort"			{return P6_BUILT_IN;}
"-S"			{return P6_BUILT_IN;}
"formline"			{return P6_BUILT_IN;}
"open"			{return P6_BUILT_IN;}
"splice"			{return P6_BUILT_IN;}
"-s"			{return P6_BUILT_IN;}
"getc"			{return P6_BUILT_IN;}
"opendir"			{return P6_BUILT_IN;}
"split"			{return P6_BUILT_IN;}
"-T"			{return P6_BUILT_IN;}
"getgrent"			{return P6_BUILT_IN;}
"ord"			{return P6_BUILT_IN;}
"sprintf"			{return P6_BUILT_IN;}
"-t"			{return P6_BUILT_IN;}
"getgrgid"			{return P6_BUILT_IN;}
"our"			{return P6_BUILT_IN;}
"sqrt"			{return P6_BUILT_IN;}
"-u"			{return P6_BUILT_IN;}
"getgrnam"			{return P6_BUILT_IN;}
"pack"			{return P6_BUILT_IN;}
"srand"			{return P6_BUILT_IN;}
"-w"			{return P6_BUILT_IN;}
"gethostbyaddr"			{return P6_BUILT_IN;}
"pipe"			{return P6_BUILT_IN;}
"stat"			{return P6_BUILT_IN;}
"-W"			{return P6_BUILT_IN;}
"gethostbyname"			{return P6_BUILT_IN;}
"pop"			{return P6_BUILT_IN;}
"state"			{return P6_BUILT_IN;}
"-X"			{return P6_BUILT_IN;}
"gethostent"			{return P6_BUILT_IN;}
"pos"			{return P6_BUILT_IN;}
"study"			{return P6_BUILT_IN;}
"-x"			{return P6_BUILT_IN;}
"getlogin"			{return P6_BUILT_IN;}
"print"			{return P6_BUILT_IN;}
"substr"			{return P6_BUILT_IN;}
"-z"			{return P6_BUILT_IN;}
"getnetbyaddr"			{return P6_BUILT_IN;}
"printf"			{return P6_BUILT_IN;}
"symlink"			{return P6_BUILT_IN;}
"abs"			{return P6_BUILT_IN;}
"getnetbyname"			{return P6_BUILT_IN;}
"prototype"			{return P6_BUILT_IN;}
"syscall"			{return P6_BUILT_IN;}
"accept"			{return P6_BUILT_IN;}
"getnetent"			{return P6_BUILT_IN;}
"push"			{return P6_BUILT_IN;}
"sysopen"			{return P6_BUILT_IN;}
"alarm"			{return P6_BUILT_IN;}
"getpeername"			{return P6_BUILT_IN;}
"quotemeta"			{return P6_BUILT_IN;}
"sysread"			{return P6_BUILT_IN;}
"atan2"			{return P6_BUILT_IN;}
"getpgrp"			{return P6_BUILT_IN;}
"rand"			{return P6_BUILT_IN;}
"sysseek"			{return P6_BUILT_IN;}
"AUTOLOAD"			{return P6_BUILT_IN;}
"getppid"			{return P6_BUILT_IN;}
"read"			{return P6_BUILT_IN;}
"system"			{return P6_BUILT_IN;}
"BEGIN"			{return P6_BUILT_IN;}
"getpriority"			{return P6_BUILT_IN;}
"readdir"			{return P6_BUILT_IN;}
"syswrite"			{return P6_BUILT_IN;}
"bind"			{return P6_BUILT_IN;}
"getprotobyname"			{return P6_BUILT_IN;}
"readline"			{return P6_BUILT_IN;}
"tell"			{return P6_BUILT_IN;}
"binmode"			{return P6_BUILT_IN;}
"getprotobynumber"			{return P6_BUILT_IN;}
"readlink"			{return P6_BUILT_IN;}
"telldir"			{return P6_BUILT_IN;}
"bless"			{return P6_BUILT_IN;}
"getprotoent"			{return P6_BUILT_IN;}
"readpipe"			{return P6_BUILT_IN;}
"tie"			{return P6_BUILT_IN;}
"break"			{return P6_BUILT_IN;}
"getpwent"			{return P6_BUILT_IN;}
"recv"			{return P6_BUILT_IN;}
"tied"			{return P6_BUILT_IN;}
"caller"			{return P6_BUILT_IN;}
"getpwnam"			{return P6_BUILT_IN;}
"redo"			{return P6_BUILT_IN;}
"time"			{return P6_BUILT_IN;}
"chdir"			{return P6_BUILT_IN;}
"getpwuid"			{return P6_BUILT_IN;}
"ref"			{return P6_BUILT_IN;}
"times"			{return P6_BUILT_IN;}
"CHECK"			{return P6_BUILT_IN;}
"getservbyname"			{return P6_BUILT_IN;}
"rename"			{return P6_BUILT_IN;}
"truncate"			{return P6_BUILT_IN;}
"chmod"			{return P6_BUILT_IN;}
"getservbyport"			{return P6_BUILT_IN;}
"require"			{return P6_BUILT_IN;}
"uc"			{return P6_BUILT_IN;}
"chomp"			{return P6_BUILT_IN;}
"getservent"			{return P6_BUILT_IN;}
"reset"			{return P6_BUILT_IN;}
"ucfirst"			{return P6_BUILT_IN;}
"chop"			{return P6_BUILT_IN;}
"getsockname"			{return P6_BUILT_IN;}
"return"			{return P6_BUILT_IN;}
"umask"			{return P6_BUILT_IN;}
"chown"			{return P6_BUILT_IN;}
"getsockopt"			{return P6_BUILT_IN;}
"reverse"			{return P6_BUILT_IN;}
"undef"			{return P6_BUILT_IN;}
"chr"			{return P6_BUILT_IN;}
"glob"			{return P6_BUILT_IN;}
"rewinddir"			{return P6_BUILT_IN;}
"UNITCHECK"			{return P6_BUILT_IN;}
"chroot"			{return P6_BUILT_IN;}
"gmtime"			{return P6_BUILT_IN;}
"rindex"			{return P6_BUILT_IN;}
"unlink"			{return P6_BUILT_IN;}
"close"			{return P6_BUILT_IN;}
"goto"			{return P6_BUILT_IN;}
"rmdir"			{return P6_BUILT_IN;}
"unpack"			{return P6_BUILT_IN;}
"closedir"			{return P6_BUILT_IN;}
"grep"			{return P6_BUILT_IN;}
"say"			{return P6_BUILT_IN;}
"unshift"			{return P6_BUILT_IN;}
"connect"			{return P6_BUILT_IN;}
"hex"			{return P6_BUILT_IN;}
"scalar"			{return P6_BUILT_IN;}
"untie"			{return P6_BUILT_IN;}
"cos"			{return P6_BUILT_IN;}
"index"			{return P6_BUILT_IN;}
"seek"			{return P6_BUILT_IN;}
"use"			{return P6_BUILT_IN;}
"crypt"			{return P6_BUILT_IN;}
"INIT"			{return P6_BUILT_IN;}
"seekdir"			{return P6_BUILT_IN;}
"utime"			{return P6_BUILT_IN;}
"dbmclose"			{return P6_BUILT_IN;}
"int"			{return P6_BUILT_IN;}
"select"			{return P6_BUILT_IN;}
"values"			{return P6_BUILT_IN;}
"dbmopen"			{return P6_BUILT_IN;}
"ioctl"			{return P6_BUILT_IN;}
"semctl"			{return P6_BUILT_IN;}
"vec"			{return P6_BUILT_IN;}
"defined"			{return P6_BUILT_IN;}
"join"			{return P6_BUILT_IN;}
"semget"			{return P6_BUILT_IN;}
"wait"			{return P6_BUILT_IN;}
"delete"			{return P6_BUILT_IN;}
"keys"			{return P6_BUILT_IN;}
"semop"			{return P6_BUILT_IN;}
"waitpid"			{return P6_BUILT_IN;}
"DESTROY"			{return P6_BUILT_IN;}
"kill"			{return P6_BUILT_IN;}
"send"			{return P6_BUILT_IN;}
"wantarray"			{return P6_BUILT_IN;}
"die"			{return P6_BUILT_IN;}
"last"			{return P6_BUILT_IN;}
"setgrent"			{return P6_BUILT_IN;}
"warn"			{return P6_BUILT_IN;}
"dump"			{return P6_BUILT_IN;}
"lc"			{return P6_BUILT_IN;}
"sethostent"			{return P6_BUILT_IN;}
"write"			{return P6_BUILT_IN;}
"each"			{return P6_BUILT_IN;}
"lcfirst"			{return P6_BUILT_IN;}
"setnetent"			{return P6_BUILT_IN;}

}


// regular string definition
/*
<STRING> {
  \"                             { yybegin(YYINITIAL);
                                   return symbol(sym.STRING_LITERAL,
                                   string.toString()); }
  [^\n\r\"\\]+                   { string.append( yytext() ); }
  \\t                            { string.append('\t'); }
  \\n                            { string.append('\n'); }

  \\r                            { string.append('\r'); }
  \\\"                           { string.append('\"'); }
  \\                             { string.append('\\'); }
}
*/
/* error fallback */
[^]    { return P6_BAD_CHARACTER; }
