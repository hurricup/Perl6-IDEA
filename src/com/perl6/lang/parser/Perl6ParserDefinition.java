package com.perl6.lang.parser;

/**
 * Created by hurricup on 12.04.2015.
 */
import com.intellij.lang.ASTNode;
import com.intellij.lang.Language;
import com.intellij.lang.ParserDefinition;
import com.intellij.lang.PsiParser;
import com.intellij.lexer.FlexAdapter;
import com.intellij.lexer.Lexer;
import com.intellij.openapi.project.Project;
import com.intellij.psi.FileViewProvider;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiFile;
import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IFileElementType;
import com.intellij.psi.tree.TokenSet;
import com.perl6.Perl6FileType;
import com.perl6.Perl6Language;
import com.perl6.lang.lexer.Perl6Lexer;
import com.perl6.lang.lexer.Perl6TokenTypes;
import com.perl6.lang.psi.Perl6File;
import com.perl6.lang.parser.Perl6Parser;
import com.perl6.lang.psi.Perl6File;
import org.jetbrains.annotations.NotNull;
import com.intellij.psi.tree.IStubFileElementType;

import java.io.Reader;

public class Perl6ParserDefinition implements ParserDefinition{
	public static final TokenSet WHITE_SPACES = TokenSet.create(TokenType.WHITE_SPACE);
	public static final TokenSet COMMENTS = TokenSet.create(Perl6TokenTypes.P6_COMMENT);
	public static final IStubFileElementType PERL6_FILE = new IStubFileElementType(Perl6FileType.PERL6_LANGUAGE);

	public static final IFileElementType FILE = new IFileElementType(Language.<Perl6Language>findInstance(Perl6Language.class));

	@NotNull
	@Override
	public Lexer createLexer(Project project) {
		return new FlexAdapter(new Perl6Lexer((Reader) null));
	}

	@NotNull
	public TokenSet getWhitespaceTokens() {
		return WHITE_SPACES;
	}

	@NotNull
	public TokenSet getCommentTokens() {
		return COMMENTS;
	}

	@NotNull
	public TokenSet getStringLiteralElements() {
		return TokenSet.EMPTY;
	}

	@NotNull
	public PsiParser createParser(final Project project) {
		return new Perl6Parser();
	}

	@Override
	public IFileElementType getFileNodeType() {
		return FILE;
	}

	public PsiFile createFile(FileViewProvider viewProvider) {
		return new Perl6File(viewProvider);
	}

	public SpaceRequirements spaceExistanceTypeBetweenTokens(ASTNode left, ASTNode right) {
		return SpaceRequirements.MAY;
	}

	@NotNull
	public PsiElement createElement(ASTNode node) {
		return Perl6PsiCreator.createElement(node);
	}
}