#Область ПрограммныйИнтерфейс

Процедура Доп_ДополнитьФорму(Форма) Экспорт
	//{{БАВ
	//Форма ДОКУМЕНТА
    ИмяФормы = Форма.ИмяФормы;
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" 
	Или ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" 
	Или ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		Доп_ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		Доп_СвязьПараметровВыбора(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" 
	Или ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		Доп_ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
		Доп_СвязьПараметровВыбора(Форма);
	КонецЕсли;
	
	//Форма СПИСКА 
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаСписка"  
	Или ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаСписка"  
	Или ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаСписка" 
	Или ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаСписка" 
	Или ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаСписка" Тогда
		Доп_ВставитьКолонкуВФормуСписка(Форма);	
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс
//Добавление поля КОНТАКТНОЕ ЛИЦО в конец группы  ГруппаШапкаПраво
Процедура Доп_ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма) Экспорт
	//{{БАВ
	ПолеВвода = Форма.Элементы.Добавить("Доп_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Доп_КонтактноеЛицо";
	//БАВ}}
КонецПроцедуры

//Вставка поля КОНТАКТНОЕ ЛИЦО перед полем СУММА ДОКУМЕНТА 
Процедура Доп_ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма) Экспорт
	//{{БАВ
	ПолеВвода = Форма.Элементы.Вставить("Доп_КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Доп_КонтактноеЛицо";
	//БАВ}}
КонецПроцедуры

Процедура Доп_ВставитьКолонкуВФормуСписка(Форма) Экспорт 
	//{{БАВ 
	//Задаем ОСНОВНАЯ ТАБЛИЦА и ТЕКСТ ЗАПРОСА
	
	ИмяФормы = Форма.ИмяФормы;

	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаСписка" Тогда 
		НоваяОсновнаяТаблица = "Документ.ЗаказПокупателя"; 
		НовыйТекстЗапроса = "ВЫБРАТЬ" + Символы.ПС + "ДокументЗаказПокупателя.Доп_КонтактноеЛицо КАК Доп_КонтактноеЛицо,";	 
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаСписка" Тогда 
		НоваяОсновнаяТаблица = "Документ.ПоступлениеТоваровУслуг";
		НовыйТекстЗапроса = "ВЫБРАТЬ" + Символы.ПС + "ДокументПоступлениеТоваровУслуг.Доп_КонтактноеЛицо КАК Доп_КонтактноеЛицо,";
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаСписка" Тогда
		НоваяОсновнаяТаблица = "Документ.РеализацияТоваровУслуг";
		НовыйТекстЗапроса = "ВЫБРАТЬ" + Символы.ПС + "ДокументРеализацияТоваровУслуг.Доп_КонтактноеЛицо КАК Доп_КонтактноеЛицо,";
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаСписка" Тогда
		НоваяОсновнаяТаблица = "Документ.ОплатаОтПокупателя";
		НовыйТекстЗапроса = "ВЫБРАТЬ" + Символы.ПС + "ДокументОплатаОтПокупателя.Доп_КонтактноеЛицо КАК Доп_КонтактноеЛицо,";
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаСписка" Тогда
		НоваяОсновнаяТаблица = "Документ.ОплатаПоставщику";
		НовыйТекстЗапроса = "ВЫБРАТЬ" + Символы.ПС + "ДокументОплатаПоставщику.Доп_КонтактноеЛицо КАК Доп_КонтактноеЛицо,";
	КонецЕсли;

	СвойстваСписка = ОбщегоНазначения.СтруктураСвойствДинамическогоСписка();
	СвойстваСписка.ОсновнаяТаблица = НоваяОсновнаяТаблица;
	СвойстваСписка.ДинамическоеСчитываниеДанных = Истина;
	ИсхТекстаЗапроса = Форма.Список.ТекстЗапроса;
	
	СвойстваСписка.ТекстЗапроса = СтрЗаменить(ИсхТекстаЗапроса, "ВЫБРАТЬ", НовыйТекстЗапроса);
	
	ОбщегоНазначения.УстановитьСвойстваДинамическогоСписка(Форма.Элементы.Список, СвойстваСписка); 
	
	ТаблицаФормы = Форма.Элементы.Список;
	КолонкаВставки = ТаблицаФормы.ПодчиненныеЭлементы.Найти("Договор");
		 
	КолонкаКонтактноеЛицо = Форма.Элементы.Вставить("Доп_КонтактноеЛицо", Тип("ПолеФормы"), ТаблицаФормы, КолонкаВставки);
	КолонкаКонтактноеЛицо.Вид = ВидПоляФормы.ПолеНадписи;
	КолонкаКонтактноеЛицо.Заголовок = "КонтактноеЛицо";
	КолонкаКонтактноеЛицо.Ширина = 5;
	КолонкаКонтактноеЛицо.ПутьКДанным = "Список.Доп_КонтактноеЛицо";
	//БАВ}}   
	
КонецПроцедуры

Процедура Доп_СвязьПараметровВыбора(Форма) Экспорт
	
	//{{БАВ		
	//Устанавливаем свойство Связи параметров выбора для реквизита Доп_КонтактноеЛицо
	НоваяСвязь = Новый СвязьПараметраВыбора("Отбор.Владелец", "Объект.Контрагент");
	НовыйМассив = Новый Массив();
	НовыйМассив.Добавить(НоваяСвязь);
	НовыеСвязи = Новый ФиксированныйМассив(НовыйМассив);
	Форма.Элементы.Доп_КонтактноеЛицо.СвязиПараметровВыбора = НовыеСвязи;
	//БАВ}}
	
КонецПроцедуры

#КонецОбласти   


















