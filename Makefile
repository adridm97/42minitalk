# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduenas- <aduenas-@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/16 22:02:33 by aduenas-          #+#    #+#              #
#    Updated: 2023/10/16 22:28:05 by aduenas-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wextra -Werror -Wall
RM = rm -f

NAME_SERVER = server
SERVER_SRC = server.c
SERVER_OBJ = ${SERVER_SRC:.c=.o}

NAME_CLIENT = client
CLIENT_SRC = client.c
CLIENT_OBJ = ${CLIENT_SRC:.c=.o}
