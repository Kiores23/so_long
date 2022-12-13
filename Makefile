NAME = so_long
NAME_TEST = t_so_long

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -rf

#	----------OBJS----------

OBJS_DIR = objs
OBJS_PATH = ./$(OBJS_DIR)/

#	-----------SRCS---------

SRCS_DIR = srcs
SRCS_PATH = ./$(SRCS_DIR)/
FILES = create_map \
		verif_map \
		verif_map_utils \
		main
SRCS = $(addprefix $(SRCS_PATH), $(addsuffix .c, $(FILES)))
SRCS_O = $(addprefix $(OBJS_PATH), $(addsuffix .o, $(FILES)))
SRCS_OR = $(addsuffix .o, $(FILES))

#	----------UTILS---------

UTILS_DIR = utils
UTILS_PATH = $(SRCS_PATH)$(UTILS_DIR)/
UTILS_PATH_O = $(OBJS_PATH)$(UTILS_DIR)/
FILES_UTILS =	ft_len \
				ft_strchr \
				rerror
UTILS = $(addprefix $(UTILS_PATH), $(addsuffix .c, $(FILES_UTILS)))
UTILS_O = $(addprefix $(UTILS_PATH_O), $(addsuffix .o, $(FILES_UTILS)))
UTILS_OR = $(addsuffix .o, $(FILES_UTILS))

#	------GET_NEXT_LINE-----

GNL_DIR = get_next_line
GNL_PATH = $(UTILS_PATH)$(GNL_DIR)/
GNL_PATH_O = $(UTILS_PATH_O)$(GNL_DIR)/
FILES_GNL =	get_next_line \
			get_next_line_utils
GNL = $(addprefix $(GNL_PATH), $(addsuffix .c, $(FILES_GNL)))
GNL_O = $(addprefix $(GNL_PATH_O), $(addsuffix .o, $(FILES_GNL)))
GNL_OR = $(addsuffix .o, $(FILES_GNL))

#	---------PRINTF---------

PF_DIR = printf
PF_PATH = $(UTILS_PATH)$(PF_DIR)/
PF_PATH_O = $(UTILS_PATH_O)$(PF_DIR)/
FILES_PF =	ft_printf \
			ft_putchar_fd \
			ft_putnbr_base_fd \
			ft_putptr_fd \
			ft_putstr_fd
PF = $(addprefix $(PF_PATH), $(addsuffix .c, $(FILES_PF)))
PF_O = $(addprefix $(PF_PATH_O), $(addsuffix .o, $(FILES_PF)))
PF_OR = $(addsuffix .o, $(FILES_PF))

#	-----------ALL----------

ALL_SRCS = $(SRCS) $(UTILS) $(GNL) $(PF)
ALL_OBJS = $(SRCS_O) $(UTILS_O) $(GNL_O) $(PF_O)
ALL_OBJS_R = $(SRCS_OR) $(UTILS_OR) $(GNL_OR) $(PF_OR)
ALL_DIR_O = $(OBJS_DIR) $(OBJS_PATH)$(UTILS_DIR) $(UTILS_PATH_O)$(GNL_DIR) $(UTILS_PATH_O)$(PF_DIR)

#	----------CMDS----------

all : $(NAME)

$(NAME) : $(ALL_SRCS) $(ALL_DIR_O)
	$(CC) $(CFLAGS) -Ilmx -c $(ALL_SRCS)
	mv $(SRCS_OR) $(OBJS_PATH)
	mv $(UTILS_OR) $(UTILS_PATH_O)
	mv $(GNL_OR) $(GNL_PATH_O)
	mv $(PF_OR) $(PF_PATH_O)
	$(CC) $(CFLAGS) -Lmlx -lmlx -framework OpenGL -framework AppKit $(ALL_OBJS) -o $@

$(OBJS_DIR) :
	mkdir $(OBJS_DIR)
$(OBJS_PATH)$(UTILS_DIR) :
	mkdir $(OBJS_PATH)$(UTILS_DIR)
$(UTILS_PATH_O)$(GNL_DIR) : 
	mkdir $(UTILS_PATH_O)$(GNL_DIR)
$(UTILS_PATH_O)$(PF_DIR) :
	mkdir $(UTILS_PATH_O)$(PF_DIR)

clean : $(ALL_DIR)
	$(RM) $(OBJS_DIR)

fclean : clean
	$(RM) $(NAME) $(NAME_TEST)

re : fclean $(NAME)

#	----------TEST----------

test : $(NAME_TEST)

$(NAME_TEST) : $(ALL_SRCS) $(ALL_DIR_O)
	$(CC) $(CFLAGS) -Ilmx -c $(ALL_SRCS)
	mv $(SRCS_OR) $(OBJS_PATH)
	mv $(UTILS_OR) $(UTILS_PATH_O)
	mv $(GNL_OR) $(GNL_PATH_O)
	mv $(PF_OR) $(PF_PATH_O)
	$(CC) $(CFLAGS) -Lmlx -lmlx -framework OpenGL -framework AppKit $(ALL_OBJS) -o $@

retest : fclean $(NAME_TEST)

.PHONY : all dir