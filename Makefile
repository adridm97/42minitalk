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

LIBFT = libft/libft.a

NAME_SERVER = server
SERVER_SRC = server.c
SERVER_OBJ = ${SERVER_SRC:.c=.o}

NAME_CLIENT = client
CLIENT_SRC = client.c
CLIENT_OBJ = ${CLIENT_SRC:.c=.o}

all: ${NAME_SERVER} ${NAME_CLIENT}

${LIBFT}:
		${MAKE} -C libft

${NAME_CLIENT}: ${CLIENT_OBJ} ${LIBFT}
		${CC} ${CFLAGS} ${CLIENT_OBJ} ${LIBFT} -o ${NAME_CLIENT}

${NAME_SERVER}: ${SERVER_OBJ} ${LIBFT}
		${CC} ${CFLAGS} ${SERVER_OBJ} ${LIBFT} -o ${NAME_SERVER}

clean:
		${MAKE} clean -C ./libft
		${RM} ${CLIENT_OBJ} ${SERVER_OBJ}

fclean: clean
		${MAKE} fclean -C ./libft
		${RM} ${NAME_SERVER} ${NAME_CLIENT}

re: fclean all

.PHONY: all clean fclean re