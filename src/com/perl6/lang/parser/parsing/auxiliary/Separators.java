package com.perl6.lang.parser.parsing.auxiliary;

import com.perl6.lang.parser.Perl6ElementTypes;
import com.intellij.lang.PsiBuilder;
import com.perl6.lang.parser.parsing.util.ParserUtils;

/**
 * Created by hurricup on 12.04.2015.
 */

public class Separators implements Perl6ElementTypes
{
	public static boolean parse(PsiBuilder builder) {
		if (P6_SEMI.equals(builder.getTokenType()) || P6_NEWLINE.equals(builder.getTokenType())) { // check for semicolumn and newlilne
			builder.advanceLexer();
			while (ParserUtils.getToken(builder, P6_NEWLINE) || ParserUtils.getToken(builder, P6_SEMI)) {
				// Parse newLines
			}
			return true;
		}

		return false;
	}
}
