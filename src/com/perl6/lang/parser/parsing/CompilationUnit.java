package com.perl6.lang.parser.parsing;

import com.intellij.lang.PsiBuilder;
import com.perl6.PerlBundle;
import com.perl6.lang.parser.PerlElementTypes;
import com.perl6.lang.parser.PerlParser;
import com.perl6.lang.parser.parsing.util.ParserUtils;
//import com.perl6.lang.parser.parsing.toplevel.packaging.PackageDefinition;
//import com.perl6.lang.parser.parsing.util.ParserUtils;

public class CompilationUnit implements PerlElementTypes
{

	public static void parseFile(PsiBuilder builder, PerlParser parser) {

	//    ParserUtils.getToken(builder, mSH_COMMENT);
	//    ParserUtils.getToken(builder, mNLS);

	//  if (!PackageDefinition.parse(builder, parser)) {
	//      parser.parseStatementWithImports(builder);
	//    }

		while (!builder.eof()) {
//			if (!Separators.parse(builder)) {
//				builder.error(PerlBundle.message("separator.expected"));
//			}
//			if (builder.eof()) break;
			if (!parser.parseStatement(builder, false)) {
//				if (!parser.parseStatementWithImports(builder)) {
				ParserUtils.wrapError(builder, PerlBundle.message("unexpected.symbol"));
		  }
		}
	}



}
