package com.perl6.lang.lexer;

/**
 * Created by hurricup on 12.04.2015.
 */

import com.intellij.psi.tree.IElementType;
import com.intellij.psi.tree.TokenSet;
import com.perl6.Perl6FileType;

public interface Perl6TokenTypes
{
	IElementType P6_BAD_CHARACTER = new Perl6ElementType("BAD_CHARACTER");
	IElementType P6_BAD_CHARACTER2 = new Perl6ElementType("BAD_CHARACTER2");
	IElementType P6_COMMENT = new Perl6ElementType("COMMENT");

	IElementType P6_FUNCTION = new Perl6ElementType("PERL_FUNCTION");
	IElementType P6_SYNTAX = new Perl6ElementType("PERL_SYNTAX");
	IElementType P6_HANDLE = new Perl6ElementType("PERL_HANDLE");
	IElementType P6_MISC = new Perl6ElementType("PERL_MISC");
	IElementType P6_VARIABLE = new Perl6ElementType("PERL_VARIABLE");
	IElementType P6_PACKAGE = new Perl6ElementType("PERL_PACKAGE");
	IElementType P6_OPERATOR = new Perl6ElementType("PERL_OPERATOR");


	IElementType P6_USER_FUNCTION = new Perl6ElementType("PERL_USER_FUNCTION");
	IElementType P6_USER_VARIABLE = new Perl6ElementType("PERL_USER_VARIABLE");

	IElementType P6_DEREFERENCE = new Perl6ElementType("DEREF");
	IElementType P6_COMMA = new Perl6ElementType("COMMA");
	IElementType P6_LBRACKET = new Perl6ElementType("[");
	IElementType P6_RBRACKET = new Perl6ElementType("]");
	IElementType P6_LSQUARE = new Perl6ElementType("[");
	IElementType P6_RSQUARE = new Perl6ElementType("]");
	IElementType P6_LCURLY = new Perl6ElementType("BLOCK");
	IElementType P6_RCURLY = new Perl6ElementType("ENDBLOCK");
	IElementType P6_SEMI = new Perl6ElementType("SEMI");

	IElementType P6_NEWLINE = new Perl6ElementType("new line");
}
