def select_books_titles_and_years_in_first_series_order_by_year
  "
  SELECT books.title, 
  CAST(books.year AS int)
  FROM books
  LEFT OUTER JOIN series
  ON series.id = books.series_id
  WHERE books.series_id = 1
  ORDER BY books.year ASC;
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "
  SELECT characters.name, characters.motto
  FROM characters
  ORDER BY LENGTH(characters.motto) DESC
  LIMIT 1;
  "
end


def select_value_and_count_of_most_prolific_species
  "
  SELECT characters.species,
  COUNT(characters.species)
  FROM characters
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) DESC
  LIMIT 1;
  "
end

def select_name_and_series_subgenres_of_authors
  "
  SELECT authors.name, subgenres.name
  FROM series
  LEFT OUTER JOIN authors ON authors.id = series.author_id
  LEFT OUTER JOIN subgenres ON subgenres.id = series.subgenre_id
  GROUP BY authors.name
  "
end

def select_series_title_with_most_human_characters
  "
  SELECT series.title
  FROM series
  LEFT OUTER JOIN authors ON series.author_id = authors.id
  LEFT OUTER JOIN characters ON authors.id = characters.author_id
  GROUP BY authors.id
  ORDER BY COUNT(CASE characters.species WHEN 'human' then 1 else null end) DESC
  LIMIT 1;
  "
end

def select_character_names_and_number_of_books_they_are_in
  "
  SELECT characters.name,
  COUNT(CASE characters.name WHEN characters.name then 1 else null end)
  FROM character_books
  LEFT OUTER JOIN characters ON characters.id = character_books.character_id
  LEFT OUTER JOIN books ON books.id = character_books.book_id
  GROUP BY characters.id
  ORDER BY COUNT(CASE characters.name WHEN characters.name then 1 else null end) DESC
  "
end
