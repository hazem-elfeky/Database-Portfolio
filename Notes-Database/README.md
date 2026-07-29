# Notes Database

## Overview

A lightweight relational database designed for a note management application. The database enables users to securely create, organize, update, and manage personal notes with optional image attachments while maintaining a simple and efficient relational structure.

## Technologies

- MySQL
- SQL
- Relational Database Design
- ER Modeling

## Database Features

- User Management
- Personal Notes Management
- Image Attachment Support
- One-to-Many Relationship
- Normalized Database Structure

## Database Design

The database follows relational database design principles using primary keys and foreign key relationships. Each user can own multiple notes, ensuring data consistency and efficient retrieval.

## Included Files

- ERD.png
- database.sql

## Main Tables

- Users
- Notes

## Relationships

- One User can create multiple Notes.
- Each Note belongs to exactly one User.

## Highlights

- Clean and lightweight schema.
- Easy to scale with additional features such as categories, tags, reminders, or note sharing.
- Optimized for CRUD operations.
