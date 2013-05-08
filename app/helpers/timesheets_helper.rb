module TimesheetsHelper

  def number_to_word(month)
     Date::MONTHNAMES[month]
  end

end
