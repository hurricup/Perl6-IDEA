package com.perl6;

import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import com.intellij.lang.Language;

public class Perl6FileType extends LanguageFileType
{
	public static final Perl6FileType PERL6_FILE_TYPE = new Perl6FileType();
	public static final Language PERL6_LANGUAGE = PERL6_FILE_TYPE.getLanguage();

	private Perl6FileType() {
		super(Perl6Language.INSTANCE);
	}

	@NotNull
	@Override
	public String getName() {
		return "Perl6 package";
	}

	@NotNull
	@Override
	public String getDescription() {
		return "Perl6 package file";
	}

	@NotNull
	@Override
	public String getDefaultExtension() {
		return "pm";
	}

	@Nullable
	@Override
	public Icon getIcon() {
		return Perl6Icons.FILE;
	}
}
