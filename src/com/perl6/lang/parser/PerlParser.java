package com.perl6.lang.parser;

/**
 * Created by hurricup on 12.04.2015.
 */
import com.intellij.lang.ASTNode;
import com.intellij.lang.PsiBuilder;
import com.intellij.lang.PsiParser;
import com.intellij.psi.tree.IElementType;
import com.perl6.lang.parser.parsing.CompilationUnit;
import com.intellij.psi.tree.TokenSet;
import com.perl6.lang.parser.parsing.util.ParserUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;


public class PerlParser implements PsiParser
{
	@NotNull
	public ASTNode parse(IElementType root, PsiBuilder builder) {
		//builder.setDebugMode(true);
/*
		if (root == OPEN_BLOCK) {
			OpenOrClosableBlock.parseOpenBlockDeep(builder, this);
		}
		else if (root == CLOSABLE_BLOCK) {
			OpenOrClosableBlock.parseClosableBlockDeep(builder, this);
		}
		else if (root == CONSTRUCTOR_BODY) {
			ConstructorBody.parseConstructorBodyDeep(builder, this);
		}
		else {
		*/
			System.err.println("Root node type:");
			System.err.println(root);
//			assert root == Perl6ParserDefinition.PERL6_FILE : root;

			PsiBuilder.Marker rootMarker = builder.mark();
			CompilationUnit.parseFile(builder, this);
			rootMarker.done(root);
//		}
		return builder.getTreeBuilt();
	}

	public boolean parseStatement(PsiBuilder builder, boolean isBlockStatementNeeded) {
//		System.err.println(builder.getTokenType());
//		System.err.println(builder.getTokenText());
		builder.advanceLexer();

		return true;
	}

}
