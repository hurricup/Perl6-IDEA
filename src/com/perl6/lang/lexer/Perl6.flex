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

//%line
//%column

/*
//InputCharacter = [^\r\n]
*/
LINE_TERMINATOR = [\r\n]+
WHITE_SPACE     = [ \t\f\r\n]+
CHAR_SEMI       = ;
CHAR_ANY        = .
ALFANUM         = [a-zA-Z0-9]

DEPACKAGE = "::"

PACKAGE_NAME = {ALFANUM}+ ({DEPACKAGE}{ALFANUM}+)*
FUNCTION_NAME = {ALFANUM}+
USER_VARIABLE = [$%*@]{ALFANUM}+

END_OF_LINE_COMMENT = "#" {CHAR_ANY}* {LINE_TERMINATOR}?

%{
  StringBuffer stringBuffer = new StringBuffer();

 /* private IElementType element(int type, Object value) {
    return new IElementType(type, value);
  }*/
%}

//%state STRING
%state PACKAGE_DEFINITION
%state FUNCTION_DEFINITION
%state PACKAGE_USE
%state YYINITIAL
%state STRING_SQ
%state STRING_DQ

%%

/*
<STRING_DQ> {
  \"                             { yybegin(YYINITIAL);
                                   return symbol(P6_STRING,
                                   stringBuffer.toString()); }
  [^\n\r\"\\]+                   { stringBuffer.append( yytext() ); }
  \\t                            { stringBuffer.append('\t'); }
  \\n                            { stringBuffer.append('\n'); }

  \\r                            { stringBuffer.append('\r'); }
  \\\"                           { stringBuffer.append('\"'); }
  \\                             { stringBuffer.append('\\'); }
}

<STRING_SQ> {
  \'                             { yybegin(YYINITIAL);
                                   return symbol(P6_STRING,
                                   stringBuffer.toString()); }
  \\\'                           { stringBuffer.append('\''); }
  {CHAR_ANY}                     { stringBuffer.append( yytext() ); }
}*/

{CHAR_SEMI}     {yybegin(YYINITIAL);return P6_SEMI;}
{WHITE_SPACE}   {return TokenType.WHITE_SPACE;}
"{"             {return P6_LCURLY;}
"}"             {return P6_RCURLY;}
"["             {return P6_LSQUARE;}
"]"             {return P6_RSQUARE;}
"("             {return P6_LBRACKET;}
")"             {return P6_RBRACKET;}
","			{return P6_COMMA;}
"=>"			{return P6_COMMA;}
"->"			{return P6_DEREFERENCE;}

///////////////////////////////// PERL VARIABLE ////////////////////////////////////////////////////////////////////////
"$!"			{return P6_VARIABLE;}
"$^RE_TRIE_MAXBUF"			{return P6_VARIABLE;}
"$LAST_REGEXP_CODE_RESULT"			{return P6_VARIABLE;}
\$\"			{return P6_VARIABLE;}
"$^S"			{return P6_VARIABLE;}
"$LIST_SEPARATOR"			{return P6_VARIABLE;}
"$#"			{return P6_VARIABLE;}
"$^T"			{return P6_VARIABLE;}
"$MATCH"			{return P6_VARIABLE;}
"$$"			{return P6_VARIABLE;}
"$^TAINT"			{return P6_VARIABLE;}
"$MULTILINE_MATCHING"			{return P6_VARIABLE;}
"$%"			{return P6_VARIABLE;}
"$^UNICODE"			{return P6_VARIABLE;}
"$NR"			{return P6_VARIABLE;}
"$&"			{return P6_VARIABLE;}
"$^UTF8LOCALE"			{return P6_VARIABLE;}
"$OFMT"			{return P6_VARIABLE;}
"$'"			{return P6_VARIABLE;}
"$^V"			{return P6_VARIABLE;}
"$OFS"			{return P6_VARIABLE;}
"$("			{return P6_VARIABLE;}
"$^W"			{return P6_VARIABLE;}
"$ORS"			{return P6_VARIABLE;}
"$)"			{return P6_VARIABLE;}
"$^WARNING_BITS"			{return P6_VARIABLE;}
"$OS_ERROR"			{return P6_VARIABLE;}
"$*"			{return P6_VARIABLE;}
"$^WIDE_SYSTEM_CALLS"			{return P6_VARIABLE;}
"$OSNAME"			{return P6_VARIABLE;}
"$+"			{return P6_VARIABLE;}
"$^X"			{return P6_VARIABLE;}
"$OUTPUT_AUTO_FLUSH"			{return P6_VARIABLE;}
"$,"			{return P6_VARIABLE;}
"$_"			{return P6_VARIABLE;}
"$OUTPUT_FIELD_SEPARATOR"			{return P6_VARIABLE;}
"$-"			{return P6_VARIABLE;}
"$`"			{return P6_VARIABLE;}
"$OUTPUT_RECORD_SEPARATOR"			{return P6_VARIABLE;}
"$."			{return P6_VARIABLE;}
"$a"			{return P6_VARIABLE;}
"$PERL_VERSION"			{return P6_VARIABLE;}
"$/"			{return P6_VARIABLE;}
"$ACCUMULATOR"			{return P6_VARIABLE;}
"$PERLDB"			{return P6_VARIABLE;}
"$0"			{return P6_VARIABLE;}
"$ARG"			{return P6_VARIABLE;}
"$PID"			{return P6_VARIABLE;}
"$:"			{return P6_VARIABLE;}
"$ARGV"			{return P6_VARIABLE;}
"$POSTMATCH"			{return P6_VARIABLE;}
"$;"			{return P6_VARIABLE;}
"$b"			{return P6_VARIABLE;}
"$PREMATCH"			{return P6_VARIABLE;}
"$<"			{return P6_VARIABLE;}
"$BASETIME"			{return P6_VARIABLE;}
"$PROCESS_ID"			{return P6_VARIABLE;}
"$="			{return P6_VARIABLE;}
"$CHILD_ERROR"			{return P6_VARIABLE;}
"$PROGRAM_NAME"			{return P6_VARIABLE;}
"$>"			{return P6_VARIABLE;}
"$COMPILING"			{return P6_VARIABLE;}
"$REAL_GROUP_ID"			{return P6_VARIABLE;}
"$?"			{return P6_VARIABLE;}
"$DEBUGGING"			{return P6_VARIABLE;}
"$REAL_USER_ID"			{return P6_VARIABLE;}
"$@"			{return P6_VARIABLE;}
"$EFFECTIVE_GROUP_ID"			{return P6_VARIABLE;}
"$RS"			{return P6_VARIABLE;}
"$["			{return P6_VARIABLE;}
"$EFFECTIVE_USER_ID"			{return P6_VARIABLE;}
"$SUBSCRIPT_SEPARATOR"			{return P6_VARIABLE;}
\$\\			{return P6_VARIABLE;}
"$EGID"			{return P6_VARIABLE;}
"$SUBSEP"			{return P6_VARIABLE;}
"$]"			{return P6_VARIABLE;}
"$ERRNO"			{return P6_VARIABLE;}
"$SYSTEM_FD_MAX"			{return P6_VARIABLE;}
"$^"			{return P6_VARIABLE;}
"$EUID"			{return P6_VARIABLE;}
"$UID"			{return P6_VARIABLE;}
"$^A"			{return P6_VARIABLE;}
"$EVAL_ERROR"			{return P6_VARIABLE;}
"$WARNING"			{return P6_VARIABLE;}
"$^C"			{return P6_VARIABLE;}
"$EXCEPTIONS_BEING_CAUGHT"			{return P6_VARIABLE;}
"$|"			{return P6_VARIABLE;}
"$^CHILD_ERROR_NATIVE"			{return P6_VARIABLE;}
"$EXECUTABLE_NAME"			{return P6_VARIABLE;}
"$~"			{return P6_VARIABLE;}
"$^D"			{return P6_VARIABLE;}
"$EXTENDED_OS_ERROR"			{return P6_VARIABLE;}
"%!"			{return P6_VARIABLE;}
"$^E"			{return P6_VARIABLE;}
"$FORMAT_FORMFEED"			{return P6_VARIABLE;}
"%^H"			{return P6_VARIABLE;}
"$^ENCODING"			{return P6_VARIABLE;}
"$FORMAT_LINE_BREAK_CHARACTERS"			{return P6_VARIABLE;}
"%ENV"			{return P6_VARIABLE;}
"$^F"			{return P6_VARIABLE;}
"$FORMAT_LINES_LEFT"			{return P6_VARIABLE;}
"%INC"			{return P6_VARIABLE;}
"$^H"			{return P6_VARIABLE;}
"$FORMAT_LINES_PER_PAGE"			{return P6_VARIABLE;}
"%OVERLOAD"			{return P6_VARIABLE;}
"$^I"			{return P6_VARIABLE;}
"$FORMAT_NAME"			{return P6_VARIABLE;}
"%SIG"			{return P6_VARIABLE;}
"$^L"			{return P6_VARIABLE;}
"$FORMAT_PAGE_NUMBER"			{return P6_VARIABLE;}
"@+"			{return P6_VARIABLE;}
"$^M"			{return P6_VARIABLE;}
"$FORMAT_TOP_NAME"			{return P6_VARIABLE;}
"@-"			{return P6_VARIABLE;}
"$^N"			{return P6_VARIABLE;}
"$GID"			{return P6_VARIABLE;}
"@_"			{return P6_VARIABLE;}
"$^O"			{return P6_VARIABLE;}
"$INPLACE_EDIT"			{return P6_VARIABLE;}
"@ARGV"			{return P6_VARIABLE;}
"$^OPEN"			{return P6_VARIABLE;}
"$INPUT_LINE_NUMBER"			{return P6_VARIABLE;}
"@INC"			{return P6_VARIABLE;}
"$^P"			{return P6_VARIABLE;}
"$INPUT_RECORD_SEPARATOR"			{return P6_VARIABLE;}
"@LAST_MATCH_START"			{return P6_VARIABLE;}
"$^R"			{return P6_VARIABLE;}
"$LAST_MATCH_END"			{return P6_VARIABLE;}
"$^RE_DEBUG_FLAGS"			{return P6_VARIABLE;}
"$LAST_PAREN_MATCH"			{return P6_VARIABLE;}
{USER_VARIABLE} {return P6_USER_VARIABLE;}

<PACKAGE_DEFINITION>{
    {PACKAGE_NAME}    {return P6_PACKAGE;}
}

<FUNCTION_DEFINITION>{
    {FUNCTION_NAME}    {return P6_USER_FUNCTION;}
}

<PACKAGE_USE>{
    {PACKAGE_NAME}    {yybegin(YYINITIAL);return P6_PACKAGE;}
}

<YYINITIAL> {
   /* comments */

//  \"                             { yybegin(STRING_DQ); stringBuffer.length(0); }
//  \'                             { yybegin(STRING_SQ); stringBuffer.length(0); }

  {END_OF_LINE_COMMENT}                           { yybegin(YYINITIAL); return P6_COMMENT; }



  /* whitespace */

/////////////////////////////// RESERVED WORDS /////////////////////////////////////////////////////////////////////////
    "-A"			{return P6_FUNCTION;}
    "END"			{return P6_FUNCTION;}
    "length"			{return P6_FUNCTION;}
    "setpgrp"			{return P6_FUNCTION;}
    "-B"			{return P6_FUNCTION;}
    "endgrent"			{return P6_FUNCTION;}
    "link"			{return P6_FUNCTION;}
    "setpriority"			{return P6_FUNCTION;}
    "-b"			{return P6_FUNCTION;}
    "endhostent"			{return P6_FUNCTION;}
    "listen"			{return P6_FUNCTION;}
    "setprotoent"			{return P6_FUNCTION;}
    "-C"			{return P6_FUNCTION;}
    "endnetent"			{return P6_FUNCTION;}
    "local"			{return P6_FUNCTION;}
    "setpwent"			{return P6_FUNCTION;}
    "-c"			{return P6_FUNCTION;}
    "endprotoent"			{return P6_FUNCTION;}
    "localtime"			{return P6_FUNCTION;}
    "setservent"			{return P6_FUNCTION;}
    "-d"			{return P6_FUNCTION;}
    "endpwent"			{return P6_FUNCTION;}
    "log"			{return P6_FUNCTION;}
    "setsockopt"			{return P6_FUNCTION;}
    "-e"			{return P6_FUNCTION;}
    "endservent"			{return P6_FUNCTION;}
    "lstat"			{return P6_FUNCTION;}
    "shift"			{return P6_FUNCTION;}
    "-f"			{return P6_FUNCTION;}
    "eof"			{return P6_FUNCTION;}
    "map"			{return P6_FUNCTION;}
    "shmctl"			{return P6_FUNCTION;}
    "-g"			{return P6_FUNCTION;}
    "eval"			{return P6_FUNCTION;}
    "mkdir"			{return P6_FUNCTION;}
    "shmget"			{return P6_FUNCTION;}
    "-k"			{return P6_FUNCTION;}
    "exec"			{return P6_FUNCTION;}
    "msgctl"			{return P6_FUNCTION;}
    "shmread"			{return P6_FUNCTION;}
    "-l"			{return P6_FUNCTION;}
    "exists"			{return P6_FUNCTION;}
    "msgget"			{return P6_FUNCTION;}
    "shmwrite"			{return P6_FUNCTION;}
    "-M"			{return P6_FUNCTION;}
    "exit"			{return P6_FUNCTION;}
    "msgrcv"			{return P6_FUNCTION;}
    "shutdown"			{return P6_FUNCTION;}
    "-O"			{return P6_FUNCTION;}
    "fcntl"			{return P6_FUNCTION;}
    "msgsnd"			{return P6_FUNCTION;}
    "sin"			{return P6_FUNCTION;}
    "-o"			{return P6_FUNCTION;}
    "fileno"			{return P6_FUNCTION;}
    "my"			{return P6_FUNCTION;}
    "sleep"			{return P6_FUNCTION;}
    "-p"			{return P6_FUNCTION;}
    "flock"			{return P6_FUNCTION;}
    "next"			{return P6_FUNCTION;}
    "socket"			{return P6_FUNCTION;}
    "-r"			{return P6_FUNCTION;}
    "fork"			{return P6_FUNCTION;}
    "not"			{return P6_FUNCTION;}
    "socketpair"			{return P6_FUNCTION;}
    "-R"			{return P6_FUNCTION;}
    "format"			{return P6_FUNCTION;}
    "oct"			{return P6_FUNCTION;}
    "sort"			{return P6_FUNCTION;}
    "-S"			{return P6_FUNCTION;}
    "formline"			{return P6_FUNCTION;}
    "open"			{return P6_FUNCTION;}
    "splice"			{return P6_FUNCTION;}
    "-s"			{return P6_FUNCTION;}
    "getc"			{return P6_FUNCTION;}
    "opendir"			{return P6_FUNCTION;}
    "split"			{return P6_FUNCTION;}
    "-T"			{return P6_FUNCTION;}
    "getgrent"			{return P6_FUNCTION;}
    "ord"			{return P6_FUNCTION;}
    "sprintf"			{return P6_FUNCTION;}
    "-t"			{return P6_FUNCTION;}
    "getgrgid"			{return P6_FUNCTION;}
    "our"			{return P6_FUNCTION;}
    "sqrt"			{return P6_FUNCTION;}
    "-u"			{return P6_FUNCTION;}
    "getgrnam"			{return P6_FUNCTION;}

    "package"       {yybegin(PACKAGE_DEFINITION);return P6_SYNTAX;}

    "pack"			{return P6_FUNCTION;}
    "srand"			{return P6_FUNCTION;}
    "-w"			{return P6_FUNCTION;}
    "gethostbyaddr"			{return P6_FUNCTION;}
    "pipe"			{return P6_FUNCTION;}
    "stat"			{return P6_FUNCTION;}
    "-W"			{return P6_FUNCTION;}
    "gethostbyname"			{return P6_FUNCTION;}
    "pop"			{return P6_FUNCTION;}
    "state"			{return P6_FUNCTION;}
    "-X"			{return P6_FUNCTION;}
    "gethostent"			{return P6_FUNCTION;}
    "pos"			{return P6_FUNCTION;}
    "study"			{return P6_FUNCTION;}
    "-x"			{return P6_FUNCTION;}
    "getlogin"			{return P6_FUNCTION;}
    "print"			{return P6_FUNCTION;}
    "substr"			{return P6_FUNCTION;}
    "-z"			{return P6_FUNCTION;}
    "getnetbyaddr"			{return P6_FUNCTION;}
    "printf"			{return P6_FUNCTION;}
    "symlink"			{return P6_FUNCTION;}
    "abs"			{return P6_FUNCTION;}
    "getnetbyname"			{return P6_FUNCTION;}
    "prototype"			{return P6_FUNCTION;}
    "syscall"			{return P6_FUNCTION;}
    "accept"			{return P6_FUNCTION;}
    "getnetent"			{return P6_FUNCTION;}
    "push"			{return P6_FUNCTION;}
    "sysopen"			{return P6_FUNCTION;}
    "alarm"			{return P6_FUNCTION;}
    "getpeername"			{return P6_FUNCTION;}
    "quotemeta"			{return P6_FUNCTION;}
    "sysread"			{return P6_FUNCTION;}
    "atan2"			{return P6_FUNCTION;}
    "getpgrp"			{return P6_FUNCTION;}
    "rand"			{return P6_FUNCTION;}
    "sysseek"			{return P6_FUNCTION;}
    "AUTOLOAD"			{return P6_FUNCTION;}
    "getppid"			{return P6_FUNCTION;}
    "read"			{return P6_FUNCTION;}
    "system"			{return P6_FUNCTION;}
    "BEGIN"			{return P6_FUNCTION;}
    "getpriority"			{return P6_FUNCTION;}
    "readdir"			{return P6_FUNCTION;}
    "syswrite"			{return P6_FUNCTION;}
    "bind"			{return P6_FUNCTION;}
    "getprotobyname"			{return P6_FUNCTION;}
    "readline"			{return P6_FUNCTION;}
    "tell"			{return P6_FUNCTION;}
    "binmode"			{return P6_FUNCTION;}
    "getprotobynumber"			{return P6_FUNCTION;}
    "readlink"			{return P6_FUNCTION;}
    "telldir"			{return P6_FUNCTION;}
    "bless"			{return P6_FUNCTION;}
    "getprotoent"			{return P6_FUNCTION;}
    "readpipe"			{return P6_FUNCTION;}
    "tie"			{return P6_FUNCTION;}
    "break"			{return P6_FUNCTION;}
    "getpwent"			{return P6_FUNCTION;}
    "recv"			{return P6_FUNCTION;}
    "tied"			{return P6_FUNCTION;}
    "caller"			{return P6_FUNCTION;}
    "getpwnam"			{return P6_FUNCTION;}
    "redo"			{return P6_FUNCTION;}
    "time"			{return P6_FUNCTION;}
    "chdir"			{return P6_FUNCTION;}
    "getpwuid"			{return P6_FUNCTION;}
    "ref"			{return P6_FUNCTION;}
    "times"			{return P6_FUNCTION;}
    "CHECK"			{return P6_FUNCTION;}
    "getservbyname"			{return P6_FUNCTION;}
    "rename"			{return P6_FUNCTION;}
    "truncate"			{return P6_FUNCTION;}
    "chmod"			{return P6_FUNCTION;}
    "getservbyport"			{return P6_FUNCTION;}
    "require"			{return P6_FUNCTION;}
    "uc"			{return P6_FUNCTION;}
    "chomp"			{return P6_FUNCTION;}
    "getservent"			{return P6_FUNCTION;}
    "reset"			{return P6_FUNCTION;}
    "ucfirst"			{return P6_FUNCTION;}
    "chop"			{return P6_FUNCTION;}
    "getsockname"			{return P6_FUNCTION;}
    "return"			{return P6_FUNCTION;}
    "umask"			{return P6_FUNCTION;}
    "chown"			{return P6_FUNCTION;}
    "getsockopt"			{return P6_FUNCTION;}
    "reverse"			{return P6_FUNCTION;}
    "undef"			{return P6_FUNCTION;}
    "chr"			{return P6_FUNCTION;}
    "glob"			{return P6_FUNCTION;}
    "rewinddir"			{return P6_FUNCTION;}
    "UNITCHECK"			{return P6_FUNCTION;}
    "chroot"			{return P6_FUNCTION;}
    "gmtime"			{return P6_FUNCTION;}
    "rindex"			{return P6_FUNCTION;}
    "unlink"			{return P6_FUNCTION;}
    "close"			{return P6_FUNCTION;}
    "goto"			{return P6_FUNCTION;}
    "rmdir"			{return P6_FUNCTION;}
    "unpack"			{return P6_FUNCTION;}
    "closedir"			{return P6_FUNCTION;}
    "grep"			{return P6_FUNCTION;}
    "say"			{return P6_FUNCTION;}
    "unshift"			{return P6_FUNCTION;}
    "connect"			{return P6_FUNCTION;}
    "hex"			{return P6_FUNCTION;}
    "scalar"			{return P6_FUNCTION;}
    "untie"			{return P6_FUNCTION;}
    "cos"			{return P6_FUNCTION;}
    "index"			{return P6_FUNCTION;}
    "seek"			{return P6_FUNCTION;}
    "use"			{yybegin(PACKAGE_USE);return P6_FUNCTION;}
    "crypt"			{return P6_FUNCTION;}
    "INIT"			{return P6_FUNCTION;}
    "seekdir"			{return P6_FUNCTION;}
    "utime"			{return P6_FUNCTION;}
    "dbmclose"			{return P6_FUNCTION;}
    "int"			{return P6_FUNCTION;}
    "select"			{return P6_FUNCTION;}
    "values"			{return P6_FUNCTION;}
    "dbmopen"			{return P6_FUNCTION;}
    "ioctl"			{return P6_FUNCTION;}
    "semctl"			{return P6_FUNCTION;}
    "vec"			{return P6_FUNCTION;}
    "defined"			{return P6_FUNCTION;}
    "join"			{return P6_FUNCTION;}
    "semget"			{return P6_FUNCTION;}
    "wait"			{return P6_FUNCTION;}
    "delete"			{return P6_FUNCTION;}
    "keys"			{return P6_FUNCTION;}
    "semop"			{return P6_FUNCTION;}
    "waitpid"			{return P6_FUNCTION;}
    "DESTROY"			{return P6_FUNCTION;}
    "kill"			{return P6_FUNCTION;}
    "send"			{return P6_FUNCTION;}
    "wantarray"			{return P6_FUNCTION;}
    "die"			{return P6_FUNCTION;}
    "last"			{return P6_FUNCTION;}
    "setgrent"			{return P6_FUNCTION;}
    "warn"			{return P6_FUNCTION;}
    "dump"			{return P6_FUNCTION;}
    "lc"			{return P6_FUNCTION;}
    "sethostent"			{return P6_FUNCTION;}
    "write"			{return P6_FUNCTION;}
    "each"			{return P6_FUNCTION;}
    "lcfirst"			{return P6_FUNCTION;}
    "setnetent"			{return P6_FUNCTION;}

//////////////////////////// PERL SYNTAX ///////////////////////////////////////////////////////////////////////////////
    "__DATA__"			{return P6_SYNTAX;}
    "else"			{return P6_SYNTAX;}
    "lock"			{return P6_SYNTAX;}
    "qw"			{return P6_SYNTAX;}
    "__END__"			{return P6_SYNTAX;}
    "elsif"			{return P6_SYNTAX;}
    "lt"			{return P6_SYNTAX;}
    "qx"			{return P6_SYNTAX;}
    "__FILE__"			{return P6_SYNTAX;}
    "eq"			{return P6_SYNTAX;}
    "m"			{return P6_SYNTAX;}
    "s"			{return P6_SYNTAX;}
    "__LINE__"			{return P6_SYNTAX;}
    "exp"			{return P6_SYNTAX;}
    "ne"			{return P6_SYNTAX;}
    "sub"			{yybegin(FUNCTION_DEFINITION); return P6_SYNTAX;}
    "__PACKAGE__"			{return P6_SYNTAX;}
    "for"			{return P6_SYNTAX;}
    "no"			{return P6_SYNTAX;}
    "tr"			{return P6_SYNTAX;}
    "and"			{return P6_SYNTAX;}
    "foreach"			{return P6_SYNTAX;}
    "or"			{return P6_SYNTAX;}
    "unless"			{return P6_SYNTAX;}
    "cmp"			{return P6_SYNTAX;}
    "ge"			{return P6_SYNTAX;}
    "until"			{return P6_SYNTAX;}
    "continue"			{return P6_SYNTAX;}
    "gt"			{return P6_SYNTAX;}
    "q"			{return P6_SYNTAX;}
    "while"			{return P6_SYNTAX;}
    "CORE"			{return P6_SYNTAX;}
    "if"			{return P6_SYNTAX;}
    "qq"			{return P6_SYNTAX;}
    "xor"			{return P6_SYNTAX;}
    "do"			{return P6_SYNTAX;}
    "le"			{return P6_SYNTAX;}
    "qr"			{return P6_SYNTAX;}
    "y"			{return P6_SYNTAX;}


/////////////////////////////////////////// PERL FILE HANDLES //////////////////////////////////////////////////////////
    "ARGV"			{return P6_HANDLE;}
    "STDERR"			{return P6_HANDLE;}
    "STDOUT"			{return P6_HANDLE;}
    "ARGVOUT"			{return P6_HANDLE;}
    "STDIN"			{return P6_HANDLE;}

/////////////////////////////////////////// PERL MISC //////////////////////////////////////////////////////////////////
    "%+"			{return P6_MISC;}
    "EXTENDED_OS_ERROR"			{return P6_MISC;}
    "PERL_DESTRUCT_LEVEL"			{return P6_MISC;}
    "%-"			{return P6_MISC;}
    "fail"			{return P6_MISC;}
    "PERL_DL_NONLAZY"			{return P6_MISC;}
    "1"			{return P6_MISC;}
    "FETCH"			{return P6_MISC;}
    "PERL_ENCODING"			{return P6_MISC;}
    "2"			{return P6_MISC;}
    "FETCHSIZE"			{return P6_MISC;}
    "PERL_HASH_SEED"			{return P6_MISC;}
    "3"			{return P6_MISC;}
    "file_name_is_absolute"			{return P6_MISC;}
    "PERL_HASH_SEED_DEBUG"			{return P6_MISC;}
    "4"			{return P6_MISC;}
    "fileparse"			{return P6_MISC;}
    "PERL_ROOT"			{return P6_MISC;}
    "5"			{return P6_MISC;}
    "fileparse_set_fstype"			{return P6_MISC;}
    "PERL_SIGNALS"			{return P6_MISC;}
    "6"			{return P6_MISC;}
    "find"			{return P6_MISC;}
    "PERL_UNICODE"			{return P6_MISC;}
    "7"			{return P6_MISC;}
    "finddepth"			{return P6_MISC;}
    "PERL_VERSION"			{return P6_MISC;}
    "8"			{return P6_MISC;}
    "FIRSTKEY"			{return P6_MISC;}
    "PERLDB"			{return P6_MISC;}
    "9"			{return P6_MISC;}
    "FORMAT_FORMFEED"			{return P6_MISC;}
    "PERLIO"			{return P6_MISC;}
    ":bytes"			{return P6_MISC;}
    "FORMAT_LINE_BREAK_CHARACTERS"			{return P6_MISC;}
    "PERLIO_DEBUG"			{return P6_MISC;}
    ":crlf"			{return P6_MISC;}
    "FORMAT_LINES_LEFT"			{return P6_MISC;}
    "PERLLIB"			{return P6_MISC;}
    ":mmap"			{return P6_MISC;}
    "FORMAT_LINES_PER_PAGE"			{return P6_MISC;}
    "PID"			{return P6_MISC;}
    ":perlio"			{return P6_MISC;}
    "FORMAT_NAME"			{return P6_MISC;}
    "plan"			{return P6_MISC;}
    ":pop"			{return P6_MISC;}
    "FORMAT_PAGE_NUMBER"			{return P6_MISC;}
    "pod"			{return P6_MISC;}
    ":raw"			{return P6_MISC;}
    "FORMAT_TOP_NAME"			{return P6_MISC;}
    "POP"			{return P6_MISC;}
    ":stdio"			{return P6_MISC;}
    "freeze"			{return P6_MISC;}
    "POSTMATCH"			{return P6_MISC;}
    ":unix"			{return P6_MISC;}
    "GETC"			{return P6_MISC;}
    "PREMATCH"			{return P6_MISC;}
    ":utf8"			{return P6_MISC;}
    "GetOptions"			{return P6_MISC;}
    "PRINT"			{return P6_MISC;}
    ":win32"			{return P6_MISC;}
    "GID"			{return P6_MISC;}
    "PRINTF"			{return P6_MISC;}
    "@F"			{return P6_MISC;}
    "head1"			{return P6_MISC;}
    "PROCESS_ID"			{return P6_MISC;}
    "_"			{return P6_MISC;}
    "head2"			{return P6_MISC;}
    "PROGRAM_NAME"			{return P6_MISC;}
    "__DIE__"			{return P6_MISC;}
    "head3"			{return P6_MISC;}
    "PUSH"			{return P6_MISC;}
    "__WARN__"			{return P6_MISC;}
    "head4"			{return P6_MISC;}
    "RE_DEBUG_FLAGS"			{return P6_MISC;}
    "a"			{return P6_MISC;}
    "HOME"			{return P6_MISC;}
    "RE_TRIE_MAXBUF"			{return P6_MISC;}
    "abs2rel"			{return P6_MISC;}
    "INC"			{return P6_MISC;}
    "READ"			{return P6_MISC;}
    "ACCUMULATOR"			{return P6_MISC;}
    "INPLACE_EDIT"			{return P6_MISC;}
    "READLINE"			{return P6_MISC;}
    "ARG"			{return P6_MISC;}
    "INPUT_LINE_NUMBER"			{return P6_MISC;}
    "REAL_GROUP_ID"			{return P6_MISC;}
    "b"			{return P6_MISC;}
    "INPUT_RECORD_SEPARATOR"			{return P6_MISC;}
    "REAL_USER_ID"			{return P6_MISC;}
    "back"			{return P6_MISC;}
    "is"			{return P6_MISC;}
    "rel2abs"			{return P6_MISC;}
    "basename"			{return P6_MISC;}
    "is_deeply"			{return P6_MISC;}
    "require_ok"			{return P6_MISC;}
    "BASETIME"			{return P6_MISC;}
    "ISA"			{return P6_MISC;}
    "rmscopy"			{return P6_MISC;}
    "begin"			{return P6_MISC;}
    "isa"			{return P6_MISC;}
    "rmtree"			{return P6_MISC;}
    "builder"			{return P6_MISC;}
    "isa_ok"			{return P6_MISC;}
    "rootdir"			{return P6_MISC;}
    "can"			{return P6_MISC;}
    "isnt"			{return P6_MISC;}
    "RS"			{return P6_MISC;}
    "can_ok"			{return P6_MISC;}
    "item"			{return P6_MISC;}
    "safe_level"			{return P6_MISC;}
    "canonpath"			{return P6_MISC;}
    "LAST_MATCH_END"			{return P6_MISC;}
    "SHIFT"			{return P6_MISC;}
    "carp"			{return P6_MISC;}
    "LAST_MATCH_START"			{return P6_MISC;}
    "shortmess"			{return P6_MISC;}
    "case_tolerant"			{return P6_MISC;}
    "LAST_PAREN_MATCH"			{return P6_MISC;}
    "SIG"			{return P6_MISC;}
    "catdir"			{return P6_MISC;}
    "LAST_REGEXP_CODE_RESULT"			{return P6_MISC;}
    "skip"			{return P6_MISC;}
    "catfile"			{return P6_MISC;}
    "LAST_SUBMATCH_RESULT"			{return P6_MISC;}
    "SKIP:"			{return P6_MISC;}
    "catpath"			{return P6_MISC;}
    "like"			{return P6_MISC;}
    "SPLICE"			{return P6_MISC;}
    "CHILD_ERROR"			{return P6_MISC;}
    "LIST_SEPARATOR"			{return P6_MISC;}
    "splitdir"			{return P6_MISC;}
    "CHILD_ERROR_NATIVE"			{return P6_MISC;}
    "LOGDIR"			{return P6_MISC;}
    "splitpath"			{return P6_MISC;}
    "CLEAR"			{return P6_MISC;}
    "longmess"			{return P6_MISC;}
    "STORE"			{return P6_MISC;}
    "CLOSE"			{return P6_MISC;}
    "MATCH"			{return P6_MISC;}
    "STORESIZE"			{return P6_MISC;}
    "cluck"			{return P6_MISC;}
    "mkdtemp"			{return P6_MISC;}
    "SUBSCRIPT_SEPARATOR"			{return P6_MISC;}
    "cmp_ok"			{return P6_MISC;}
    "mkpath"			{return P6_MISC;}
    "SUBSEP"			{return P6_MISC;}
    "COMPILING"			{return P6_MISC;}
    "mkstemp"			{return P6_MISC;}
    "SYSTEM_FD_MAX"			{return P6_MISC;}
    "confess"			{return P6_MISC;}
    "mkstemps"			{return P6_MISC;}
    "TAINT"			{return P6_MISC;}
    "copy"			{return P6_MISC;}
    "mktemp"			{return P6_MISC;}
    "tempdir"			{return P6_MISC;}
    "cp"			{return P6_MISC;}
    "move"			{return P6_MISC;}
    "tempfile"			{return P6_MISC;}
    "croak"			{return P6_MISC;}
    "MULTILINE_MATCHING"			{return P6_MISC;}
    "thaw"			{return P6_MISC;}
    "curdir"			{return P6_MISC;}
    "mv"			{return P6_MISC;}
    "TIEARRAY"			{return P6_MISC;}
    "cut"			{return P6_MISC;}
    "NEXTKEY"			{return P6_MISC;}
    "TIEHANDLE"			{return P6_MISC;}
    "DATA"			{return P6_MISC;}
    "no_upwards"			{return P6_MISC;}
    "TIEHASH"			{return P6_MISC;}
    "DEBUGGING"			{return P6_MISC;}
    "NR"			{return P6_MISC;}
    "TIESCALAR"			{return P6_MISC;}
    "DELETE"			{return P6_MISC;}
    "OFS"			{return P6_MISC;}
    "tmpdir"			{return P6_MISC;}
    "devnull"			{return P6_MISC;}
    "ok"			{return P6_MISC;}
    "tmpfile"			{return P6_MISC;}
    "diag"			{return P6_MISC;}
    "OPEN"			{return P6_MISC;}
    "tmpnam"			{return P6_MISC;}
    "dirname"			{return P6_MISC;}
    "ORS"			{return P6_MISC;}
    "TODO:"			{return P6_MISC;}
    "EFFECTIVE_GROUP_ID"			{return P6_MISC;}
    "OS_ERROR"			{return P6_MISC;}
    "todo_skip"			{return P6_MISC;}
    "EFFECTIVE_USER_ID"			{return P6_MISC;}
    "OSNAME"			{return P6_MISC;}
    "UID"			{return P6_MISC;}
    "EGID"			{return P6_MISC;}
    "OUTPUT_AUTOFLUSH"			{return P6_MISC;}
    "UNICODE"			{return P6_MISC;}
    "ENCODING"			{return P6_MISC;}
    "OUTPUT_FIELD_SEPARATOR"			{return P6_MISC;}
    "unlike"			{return P6_MISC;}
    "end"			{return P6_MISC;}
    "OUTPUT_RECORD_SEPARATOR"			{return P6_MISC;}
    "unlink0"			{return P6_MISC;}
    "ENV"			{return P6_MISC;}
    "over"			{return P6_MISC;}
    "UNSHIFT"			{return P6_MISC;}
    "eq_array"			{return P6_MISC;}
    "pass"			{return P6_MISC;}
    "UNTIE"			{return P6_MISC;}
    "eq_hash"			{return P6_MISC;}
    "PATH"			{return P6_MISC;}
    "updir"			{return P6_MISC;}
    "eq_set"			{return P6_MISC;}
    "path"			{return P6_MISC;}
    "use_ok"			{return P6_MISC;}
    "ERRNO"			{return P6_MISC;}
    "PERL5DB"			{return P6_MISC;}
    "UTF8CACHE"			{return P6_MISC;}
    "EUID"			{return P6_MISC;}
    "PERL5DB_THREADED"			{return P6_MISC;}
    "UTF8LOCALE"			{return P6_MISC;}
    "EVAL_ERROR"			{return P6_MISC;}
    "PERL5LIB"			{return P6_MISC;}
    "VERSION"			{return P6_MISC;}
    "EXCEPTIONS_BEING_CAUGHT"			{return P6_MISC;}
    "PERL5OPT"			{return P6_MISC;}
    "WARNING"			{return P6_MISC;}
    "EXECUTABLE_NAME"			{return P6_MISC;}
    "PERL5SHELL"			{return P6_MISC;}
    "WARNING_BITS"			{return P6_MISC;}
    "EXISTS"			{return P6_MISC;}
    "PERL_ALLOW_NON_IFS_LSP"			{return P6_MISC;}
    "WIN32_SLOPPY_STAT"			{return P6_MISC;}
    "EXTEND"			{return P6_MISC;}
    "PERL_DEBUG_MSTATS"			{return P6_MISC;}
    "WRITE"			{return P6_MISC;}

///////////////////////////////// PERL OPERATORS ///////////////////////////////////////////////////////////////////////
    "++"			{return P6_OPERATOR;}
    "--"			{return P6_OPERATOR;}
    "**"			{return P6_OPERATOR;}
    "!"			{return P6_OPERATOR;}
    "~"			{return P6_OPERATOR;}
    "\\"			{return P6_OPERATOR;}
    "+"			{return P6_OPERATOR;}
    "-"			{return P6_OPERATOR;}
    "=~"			{return P6_OPERATOR;}
    "!~"			{return P6_OPERATOR;}
    "*"			{return P6_OPERATOR;}
    "/"			{return P6_OPERATOR;}
    "%"			{return P6_OPERATOR;}
    "x"			{return P6_OPERATOR;}
    "<<"			{return P6_OPERATOR;}
    ">>"			{return P6_OPERATOR;}
    "<"			{return P6_OPERATOR;}
    ">"			{return P6_OPERATOR;}
    "<="			{return P6_OPERATOR;}
    ">="			{return P6_OPERATOR;}
    "lt"			{return P6_OPERATOR;}
    "gt"			{return P6_OPERATOR;}
    "le"			{return P6_OPERATOR;}
    "ge"			{return P6_OPERATOR;}
    "=="			{return P6_OPERATOR;}
    "!="			{return P6_OPERATOR;}
    "<=>"			{return P6_OPERATOR;}
    "eq"			{return P6_OPERATOR;}
    "ne"			{return P6_OPERATOR;}
    "cmp"			{return P6_OPERATOR;}
    "~~"			{return P6_OPERATOR;}
    "&"			{return P6_OPERATOR;}
    "|"			{return P6_OPERATOR;}
    "^"			{return P6_OPERATOR;}
    "&&"			{return P6_OPERATOR;}
    "||"			{return P6_OPERATOR;}
    "//"			{return P6_OPERATOR;}
    ".."			{return P6_OPERATOR;}
    "..."			{return P6_OPERATOR;}
    "?"			{return P6_OPERATOR;}
    ":"			{return P6_OPERATOR;}
    "="			{return P6_OPERATOR;}
    "+="			{return P6_OPERATOR;}
    "-="			{return P6_OPERATOR;}
    "*="			{return P6_OPERATOR;}
    "not"			{return P6_OPERATOR;}
    "and"			{return P6_OPERATOR;}
    "or"			{return P6_OPERATOR;}
    "xor"			{return P6_OPERATOR;}
}

/* error fallback */
[^]    { return P6_BAD_CHARACTER; }
