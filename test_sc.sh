#!/bin/bash
echo "Разработчик: Сергачева Полина Игоревна"

echo "Название программы - test_sc"

echo "Данная программа позволяет создавать, удалять и перемещать файлы"

	while :
	do
	echo "Введите номер действия, которое хотите выполнить"
	echo "1 - создать файл"
	echo "2 - переместить файл"
	echo "3 - удалить файл"
		if [[ $num = "" ]]
			 echo "Введите номер действия:"
			 then read num
		fi
		while [[ $num != "1" && $num != "2" && $num != "3" ]]
		do
		echo "[ОШИБКА!!!] Вы ввели неверное значение. Повторите попытку:"
		read num
		done
			if [[ "$num" = "1" ]]
			  then echo "Введите новое имя файла"
			  read file 
			    while [[ "$file" = "" ]]
			    do
			      echo "[ПРЕДУПРЕЖДЕНИЕ] Вы не ввели название файла. Повторите попытку:"
			      read file
			   done
			  if test ! -e "$file"  
			        then
			        touch $file
			        echo "[УСПЕШНО!] Файл $FILE создан"
			  else
			        echo "[ОШИБКА!!!] Такой файл уже существует"
			  fi
			   echo "Вы хотите продолжить работу? (y/N)"
			   read answer
				if [[ $answer = "N" || $answer = "n" || $answer = "н" || $answer = "Н" ]]
				  then 
				  echo "[УСПЕШНО!] Завершение работы программы... "
				  break
				fi
		fi
                            if [[ "$num" = "2" ]]
				then echo "Введите название файла для перемещения"
			 	read name_file
				  while [[ "$name_file" = "" ]]
				  do
				   echo "[ПРЕДУПРЕЖДЕНИЕ] Вы не ввели название файла для перемещения. Повторите попытку:"
				   read name_file
				  done
				    # Проверка существования файла
				    if test -e "$name_file"
					then
					  echo "Файл найден."
					  echo "Введите путь к каталогу, куда необходимо переместить файл:"
				          tree -d ~
					  read catalog
					  # Проверка существования каталога 
						if [[ -d "$catalog" ]]
						  then
						  echo "$catalog найден..."
						  mv $name_file $catalog
						  echo "[УСПЕШНО!] Перемещение файла "$name_file" завершено." 
						else
						  echo "[ОШИБКА!!!] $catalog не найден. Повторите попытку!"
						fi
				  else
					echo "[ОШИБКА!!!] Файл с данным именем не найден. Повторите попытку!"
				  fi
					echo "Вы хотите продолжить работу? (y/N)"
					read answer
						if [[ $answer = "N" || $answer = "n" || $answer = "н" || $answer = "Н" ]]
						  then
						  echo "[УСПЕШНО!] Завершение работы программы..."
						 break
						fi
				continue

			   fi	
				if [[ "$num" = "3" ]]
				  then
				  	echo "Введите имя файла для удаления"
					read name_file
					  while [[ "$name_file" = "" ]]
				          do
				           echo "[ПРЕДУПРЕЖДЕНИЕ] Вы не указали название файла для удаления. Повторите попытку:"
					   read name_file
					  done
						if test -e "$name_file"
						   then
						   rm $name_file
						   echo "Файл $name_file найден."
						   echo "[УСПЕШНО!] Файл $name_file удалён."
						else
						   echo "[ОШИБКА!!!] Файл с данным именем не найден. Повторите попытку!"
						fi
						   echo "Вы хотите продолжить работу? (y/N)"
						   read answer
						     if [[ $answer = "N" || $answer = "n" || $answer = "н" || $answer = "Н" ]]
						       then
							echo "[УСПЕШНО!] Завершение работы программы..."
							break
						     fi
					continue
				fi
done
