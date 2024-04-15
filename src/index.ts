import express from "express";

import { PrismaClient as PrismaAuth } from "../prisma/generated/auth";
import { PrismaClient as PrismaBlog } from "../prisma/generated/blog";

const auth = new PrismaAuth();
const blog = new PrismaBlog();

const app = express();
const port = 4000;

app.get("/", async (req, res) => {
  res.send("Hello, TypeScript with Express!");
});

app.get("/createuser", async (req, res) => {
  await auth.user.deleteMany();
  const user = await auth.user.create({
    data: {
      name: "Abel",
      email: "abelgetu27@gmail.com",
      age: 28,
      userPreference: {
        create: {
          emailUpdates: true,
        },
      },
    },
    select: {
      name: true,
      age: true,
      userPreference: true,
    },
  });

  res.send(`${user.name}`);
});

app.get("/createcategory", async (req, res) => {
  await blog.category.deleteMany();
  const category = await blog.category.create({
    data: {
      name: "Category name",
    },
  });

  console.log(category);
  res.send(`${category.name}`)
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
