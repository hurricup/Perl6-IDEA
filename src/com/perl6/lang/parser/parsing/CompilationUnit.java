package com.perl6.lang.parser.parsing;

import com.intellij.lang.PsiBuilder;
import com.perl6.Perl6Bundle;
import com.perl6.lang.parser.Perl6ElementTypes;
import com.perl6.lang.parser.Perl6Parser;
import com.perl6.lang.parser.parsing.auxiliary.Separators;
import com.perl6.lang.parser.parsing.util.ParserUtils;
//import com.perl6.lang.parser.parsing.toplevel.packaging.PackageDefinition;
//import com.perl6.lang.parser.parsing.util.ParserUtils;

public class CompilationUnit implements Perl6ElementTypes {

	public static void parseFile(PsiBuilder builder, Perl6Parser parser) {

	//    ParserUtils.getToken(builder, mSH_COMMENT);
	//    ParserUtils.getToken(builder, mNLS);

	//  if (!PackageDefinition.parse(builder, parser)) {
	//      parser.parseStatementWithImports(builder);
	//    }

		while (!builder.eof()) {
			if (!Separators.parse(builder)) {
				builder.error(Perl6Bundle.message("separator.expected"));
			}
			if (builder.eof()) break;
			if (!parser.parseStatement(builder, false)) {
//				if (!parser.parseStatementWithImports(builder)) {
				ParserUtils.wrapError(builder, Perl6Bundle.message("unexpected.symbol"));
		  }
		}
	}



}
