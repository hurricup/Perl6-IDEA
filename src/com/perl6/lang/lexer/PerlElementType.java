package com.perl6.lang.lexer;

/**
 * Created by hurricup on 12.04.2015.
 */

import com.intellij.psi.tree.IElementType;
import com.perl6.PerlFileType;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class PerlElementType extends IElementType
{
	private String debugName = null;

	public PerlElementType(@NotNull @NonNls String debugName) {
		super(debugName, PerlFileType.PERL6_LANGUAGE);
		this.debugName = debugName;
	}

	public String toString() {
		return "Perl6TokenType " + super.toString();
	}

//	public static abstract class PsiCreator extends Perl6ElementType {
//		protected PsiCreator(String debugName) {
//			super(debugName);
//		}

	//	public abstract Perl6PsiElement createPsi(@NotNull ASTNode node);
//	}
}
