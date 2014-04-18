Product.delete_all
Product.create(
	title: 'Java, A Beginners Guide, 5th Edition', 
	description:
      %{<p>
       Learn the fundamentals of Java programming in no time from bestselling programming author Herb Schildt. 
       Fully updated to cover Java Platform, Standard Edition 7 (Java SE 7), Java: A Beginner's Guide, Fifth 
       Edition starts with the basics, such as how to compile and run a Java program, and then discusses the 
       keywords, syntax, and constructs that form the core of the Java language. You'll also find coverage of 
       some of Java's most advanced features, including multithreaded programming and generics. An introduction 
       to Swing concludes the book. Get started programming in Java right away with help from this fast-paced tutorial.
</p>},
image_url: 'java.jpg', 
price: 20.43)

Product.create(
	title: 'Operating System Concepts', 
	description:
      %{<p>
       Operating System Concepts, now in its ninth edition, continues to provide a solid theoretical foundation 
       for understanding operating systems. The ninth edition has been thoroughly updated to include contemporary 
       	examples of how operating systems function. The text includes content to bridge the gap between concepts 
       	and actual implementations. End-of-chapter problems, exercises, review questions, and programming exercises 
       	help to further reinforce important concepts.  A new Virtual Machine provides interactive exercises to help 
       	engage students with the material.
</p>},
image_url: 'OS.jpg', 
price: 112.88)

Product.create(
	title: 'Algorithms (4th Edition)', 
	description:
      %{<p>
       The algorithms in this book represent a body of knowledge developed over the last 50 years that has become 
       indispensable, not just for professional programmers and computer science students but for any student with 
       interests in science, mathematics, and engineering, not to mention students who use computation in the liberal 
       arts.
</p>},
image_url: 'al.jpg', 
price: 59.12)