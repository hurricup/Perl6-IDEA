package com.perl6.lang.psi;

/**
 * Created by hurricup on 12.04.2015.
 */
import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import com.perl6.PerlFileType;
import com.perl6.PerlLanguage;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;

public class PerlFile extends PsiFileBase {
	public PerlFile(@NotNull FileViewProvider viewProvider) {
		super(viewProvider, PerlLanguage.INSTANCE);
	}

	@NotNull
	@Override
	public FileType getFileType() {
		return PerlFileType.PERL_FILE_TYPE;
	}

	@Override
	public String toString() {
		return "Perl6 file";
	}

	@Override
	public Icon getIcon(int flags) {
		return super.getIcon(flags);
	}
}