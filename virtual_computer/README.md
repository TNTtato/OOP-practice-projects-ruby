# Virtual Computer Project

This is OOP project in ruby from the [codeacademy.com](codeacademy.com) curriculum.

The goal for this project is to make objects of a virtual computer that can create some "files" and manipulate them somehow.

I added a few functionalities such as:

#

## Create files as objects using a `File`class:
The methods for the `File` class are:
  - `#file_type` returns the extension of the file.
  - `#modify_file_content` let us add new content to the file (a remove content functionality must be implemented as well).
  - `#rename_file` modifies the instance variable `@filename` when requiered
  - `#file_attributes` returns a hash of attributes of an instance

#

## `Computer` class functionalities added:
In this class I added quite a few methods to expand the possibilities in order to work with the files.
This additions contemplate the treatment of the files as objects created by another class, so each of the instances created with `File` was stored in the `@files` variable (each key/value pair being <*filename*> => <*file-object*>), each time `#create` is called, an instance of `File` class is created. 

The manipulation of the files created is going to be done through methods defined in `Computer` making use of the methods in `File`.

The things that we can do are:

- Modify a file using `#modify_a_file`.
- Use `#rename_a_file` to change the name of a given file.
- We can list the files that have been created using `#list_files`.
- This files can also be deleted using `#delete_a_file`.
- And the attributes of the files can be seen using `#show_a_file_attributes`. This attributes are: name, date of creation, date of last modification and the type of file.
