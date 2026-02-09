variable "name_words" {
  type    = list(string)
  #default = ["alpha", "bravo", "charlie", "delta", "echo"]
}

resource "random_shuffle" "words" {
  input        = var.name_words
  result_count = 2
}

resource "random_pet" "example" {
  length    = 2
  separator = "-"

  prefix = random_shuffle.words.result[0]
}
