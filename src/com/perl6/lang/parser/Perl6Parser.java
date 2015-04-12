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


public class Perl6Parser  implements PsiParser
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
/*
		if (isBlockStatementNeeded && GroovyTokenTypes.mLCURLY.equals(builder.getTokenType())) {
			final PsiBuilder.Marker marker = builder.mark();
			OpenOrClosableBlock.parseOpenBlockDeep(builder, this);
			marker.done(BLOCK_STATEMENT);
			return true;
		}

		if (isBlockStatementNeeded && mSEMI == builder.getTokenType()) {
			return true;
		}

		if (GroovyTokenTypes.kIMPORT.equals(builder.getTokenType())) {
			PsiBuilder.Marker marker = builder.mark();
			ImportStatement.parse(builder, this);
			marker.error(GroovyBundle.message("import.not.allowed"));
			return true;
		}

		if (GroovyTokenTypes.kIF.equals(builder.getTokenType())) {
			return parseIfStatement(builder);
		}
		if (GroovyTokenTypes.kSWITCH.equals(builder.getTokenType())) {
			SwitchStatement.parseSwitch(builder, this);
			return true;
		}
		if (GroovyTokenTypes.kTRY.equals(builder.getTokenType())) {
			return TryCatchStatement.parse(builder, this);
		}
		if (GroovyTokenTypes.kWHILE.equals(builder.getTokenType())) {
			return parseWhileStatement(builder);
		}
		if (GroovyTokenTypes.kFOR.equals(builder.getTokenType())) {
			return parseForStatement(builder);
		}
		if (ParserUtils.lookAhead(builder, GroovyTokenTypes.kSYNCHRONIZED, GroovyTokenTypes.mLPAREN)) {
			PsiBuilder.Marker synMarker = builder.mark();
			if (SynchronizedStatement.parse(builder, this)) {
				synMarker.drop();
				return true;
			}
			else {
				synMarker.rollbackTo();
			}
		}

		// Possible errors
		if (GroovyTokenTypes.kELSE.equals(builder.getTokenType())) {
			ParserUtils.wrapError(builder, GroovyBundle.message("else.without.if"));
			parseStatement(builder, true);
			return true;
		}
		if (GroovyTokenTypes.kCATCH.equals(builder.getTokenType())) {
			ParserUtils.wrapError(builder, GroovyBundle.message("catch.without.try"));
			parseStatement(builder, false);
			return true;
		}
		if (GroovyTokenTypes.kFINALLY.equals(builder.getTokenType())) {
			ParserUtils.wrapError(builder, GroovyBundle.message("finally.without.try"));
			parseStatement(builder, false);
			return true;
		}
		if (GroovyTokenTypes.kCASE.equals(builder.getTokenType())) {
			PsiBuilder.Marker marker = builder.mark();
			SwitchStatement.parseCaseLabel(builder, this);
			marker.error(GroovyBundle.message("case.without.switch"));
			parseStatement(builder, false);
			return true;
		}
		if (GroovyTokenTypes.kDEFAULT.equals(builder.getTokenType())) {
			PsiBuilder.Marker marker = builder.mark();
			SwitchStatement.parseCaseLabel(builder, this);
			marker.error(GroovyBundle.message("default.without.switch"));
			parseStatement(builder, false);
			return true;
		}

		if (BranchStatement.BRANCH_KEYWORDS.contains(builder.getTokenType())) {
			return BranchStatement.parse(builder, this);
		}
		if (parseLabeledStatement(builder)) {
			return true;
		}

		if (parseDeclaration(builder, false, false, null)) return true;
		return AssignmentExpression.parse(builder, this, true);
*/
//		System.err.println(builder.getTokenType());
//		System.err.println(builder.getTokenText());
		builder.advanceLexer();

		return true;
	}

}
