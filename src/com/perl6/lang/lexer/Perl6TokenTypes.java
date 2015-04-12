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
	IElementType P6_COMMENT = new Perl6ElementType("COMMENT");
	IElementType P6_BUILT_IN = new Perl6ElementType("DUMMY_HOLDER");

	IElementType P6_LCURLY = new Perl6ElementType("{");
	IElementType P6_RCURLY = new Perl6ElementType("}");
	IElementType P6_SEMI = new Perl6ElementType(";");
	IElementType P6_NEWLINE = new Perl6ElementType("new line");
}
