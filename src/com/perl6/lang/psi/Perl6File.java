package com.perl6.lang.psi;

/**
 * Created by hurricup on 12.04.2015.
 */
import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import com.perl6.Perl6FileType;
import com.perl6.Perl6Language;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;

public class Perl6File extends PsiFileBase {
	public Perl6File(@NotNull FileViewProvider viewProvider) {
		super(viewProvider, Perl6Language.INSTANCE);
	}

	@NotNull
	@Override
	public FileType getFileType() {
		return Perl6FileType.PERL6_FILE_TYPE;
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